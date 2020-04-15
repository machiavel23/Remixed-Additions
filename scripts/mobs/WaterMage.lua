--
-- User: mike
-- Date: 24.01.2018
-- Time: 23:58
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/revampedCommonClasses"

local mob = require"scripts/lib/mob"

local validTiles = {[1]=true,[2]=true,[3]=true,[5]=true,[6]=true,[7]=true,[8]=true,[9]=true,[11]=true,[14]=true,[15]=true,[17]=true,[18]=true,[19]=true,[20]=true,[21]=true,[22]=true,[23]=true,[25]=true,[26]=true,[27]=true,[28]=true,[29]=true,[30]=true,[31]=true,[32]=true,[33]=true,[34]=true,[37]=true,[38]=true,[39]=true,[40]=true,[42]=true,[47]=true,[48]=true,[49]=true,[50]=true,[51]=true,[52]=true,[53]=true,[54]=true,[55]=true,[56]=true,[57]=true,[58]=true,[59]=true,[60]=true,[61]=true,[62]=true,[63]=true}

return mob.init{
    zapProc = function(self, enemy, dmg)
        local newMove = math.random(1,10)
        local chrKind = enemy:getEntityKind()
        local mul = 1
        local res = 1
        if chrKind == "FireMage" then
            mul = 2
        end
        if chrKind == self:getEntityKind() or chrKind == "IceMage" then
            res = 2
        end
        RPD.playSound("snd_hit.mp3")
        if newMove >= 4 and newMove <= 6 then
            if enemy:buffLevel("Slow") > 0 then
                RPD.prolongBuff(enemy, RPD.Buffs.Slow, math.random(6*mul,14))
            else
                RPD.affectBuff(enemy, RPD.Buffs.Slow, 5*mul)
            end
            return dmg*mul/res
        elseif newMove <= 3 then
            local level = RPD.Dungeon.level
            local pos = RPD.getXy(self)
            for i = -3*mul, 3*mul do
                for j = -3*mul, 3*mul do
                    if i ~= 0 and j ~= 0 then
                        local newpos = level:cell(pos[1]+i,pos[2]+j)
                        local target = RPD.Actor:findChar(newPos)
                        if level:cellValid(newpos) and validTiles[level.map[newpos]] and not target then
                            self:getSprite():emitter():burst(RPD.Sfx.MagicMissile.MagicParticle.FACTORY, 6/mul)
                            self:placeTo(newpos-1)
                            self:getSprite():place(newpos-1)
                            self:getSprite():emitter():burst(RPD.Sfx.MagicMissile.MagicParticle.FACTORY, 6/mul)
                            RPD.placeBlob(RPD.Blobs.Regrowth, level:cell(pos), 5)
                            RPD.placePseudoBlob(RPD.PseudoBlobs.Freezing, level:cell(pos))
                            return dmg*mul/res
                        end
                    end
                end
            end
        elseif newMove >= 7 then
            local level = RPD.Dungeon.level
            local pos = RPD.getXy(enemy)
            for i = -3*mul, 3*mul do
                for j = -3*mul, 3*mul do
                    if i ~= 0 or j ~= 0 then
                        local newpos = level:cell(pos[1]+i,pos[2]+j)
                        local target = RPD.Actor:findChar(newpos)
                        if level:cellValid(newpos) and validTiles[level.map[newpos]] and not target then
                            enemy:getSprite():emitter():burst(RPD.Sfx.MagicMissile.MagicParticle.FACTORY, 6/mul)
                            enemy:placeTo(newpos-1)
                            enemy:getSprite():place(newpos-1)
                            enemy:getSprite():emitter():burst(RPD.Sfx.MagicMissile.MagicParticle.FACTORY, 6/mul)
                            RPD.placeBlob(RPD.Blobs.Regrowth, newpos, 5)
                            RPD.placePseudoBlob(RPD.PseudoBlobs.Freezing, newpos)
                            return dmg*mul/res
                        end
                    end
                end
            end
        end
    end,

    attackProc = function(self, enemy, dmg)
        local newMove = math.random(1,10)
        local chrKind = enemy:getEntityKind()
        local mul = 1
        local res = 1
        if chrKind == "FireMage" then
            mul = 2
        end
        if chrKind == self:getEntityKind() or chrKind == "IceMage" then
            res = 2
        end
        enemy:getSprite():emitter():burst(RPD.Sfx.MagicMissile.SlowParticle.FACTORY, 6/mul)
        if newMove >= 8 and newMove <= 10 then
            if enemy:buffLevel("Blindness") > 0 then
                RPD.prolongBuff(enemy, RPD.Buffs.Blindness, math.random(6*mul,14))
            else
                RPD.affectBuff(enemy, RPD.Buffs.Blindness, 5*mul)
            end
            return dmg*mul/res
        elseif newMove <= 4 then
            local level = RPD.Dungeon.level
            local pos = RPD.getXy(self)
            for i = -3*mul, 3*mul do
                for j = -3*mul, 3*mul do
                    if i ~= 0 and j ~= 0 then
                        local newpos = level:cell(pos[1]+i,pos[2]+j)
                        local target = RPD.Actor:findChar(newPos)
                        if level:cellValid(newpos) and validTiles[level.map[newpos]] and not target then
                            self:getSprite():emitter():burst(RPD.Sfx.MagicMissile.MagicParticle.FACTORY, 6/mul)
                            self:placeTo(newpos-1)
                            self:getSprite():place(newpos-1)
                            self:getSprite():emitter():burst(RPD.Sfx.MagicMissile.MagicParticle.FACTORY, 6/mul)
                            RPD.placeBlob(RPD.Blobs.Regrowth, level:cell(pos), 5)
                            RPD.placePseudoBlob(RPD.PseudoBlobs.Freezing, level:cell(pos))
                            return dmg*mul/res
                        end
                    end
                end
            end
        elseif newMove >= 5 then
            local level = RPD.Dungeon.level
            local pos = RPD.getXy(enemy)
            for i = -3*mul, 3*mul do
                for j = -3*mul, 3*mul do
                    if i ~= 0 or j ~= 0 then
                        local newpos = level:cell(pos[1]+i,pos[2]+j)
                        local target = RPD.Actor:findChar(newpos)
                        if level:cellValid(newpos) and validTiles[level.map[newpos]] and not target then
                            enemy:getSprite():emitter():burst(RPD.Sfx.MagicMissile.MagicParticle.FACTORY, 6/mul)
                            enemy:placeTo(newpos-1)
                            enemy:getSprite():place(newpos-1)
                            enemy:getSprite():emitter():burst(RPD.Sfx.MagicMissile.MagicParticle.FACTORY, 6/mul)
                            RPD.placeBlob(RPD.Blobs.Regrowth, newpos, 5)
                            RPD.placePseudoBlob(RPD.PseudoBlobs.Freezing, newpos)
                            return dmg*mul/res
                        end
                    end
                end
            end
        end
    end,

    defenceProc = function(self, enemy, dmg)
        local level = RPD.Dungeon.level
        local pos = RPD.getXy(self)
        local chrKind = enemy:getEntityKind()
        local mul = 1
        if chrKind == "EarthMage" then
            mul = 2
        end
        for i = -3*mul, 3*mul do
            for j = -3*mul, 3*mul do
                if i ~= 0 or j ~= 0 then
                    local newpos = level:cell(pos[1]+i,pos[2]+j)
                    local target = RPD.Actor:findChar(newpos)
                    if level:cellValid(newpos) and validTiles[level.map[newpos]] and not target then
                        self:getSprite():emitter():burst(RPD.Sfx.MagicMissile.MagicParticle.FACTORY, 6*mul)
                        self:placeTo(newpos-1)
                        self:getSprite():place(newpos-1)
                        self:getSprite():emitter():burst(RPD.Sfx.MagicMissile.MagicParticle.FACTORY, 6*mul)
                        RPD.placeBlob(RPD.Blobs.Regrowth, level:cell(pos), 5)
                        RPD.placePseudoBlob(RPD.PseudoBlobs.Freezing, level:cell(pos))
                        return dmg
                    end
                end
            end
        end
    end,

    stats = function(self)
        self:resistances():add(RPD.Buffs.Frost)
        self:resistances():add(RPD.Enchantments.Slow)
        self:resistances():add(RPD.Spells.Ignite)
        self:resistances():add(RPD.Blobs.Fire)
        self:resistances():add(RPD.Blobs.LiquidFlame)
        self:resistances():add(RPD.Blobs.Web)
        self:resistances():add(RPD.PseudoBlobs.Freezing)
        self:resistances():add(RPD.Buffs.Necrotism)
        self:resistances():add(RPD.Buffs.Blindness)
        self:resistances():add(RPD.Buffs.Bleeding)
        self:resistances():add(RPD.Buffs.Ooze)
        self:resistances():add(RPD.Enchantments.Fire)
        self:resistances():add("SubZero")
        self:resistances():add(RPD.Glyphs.Entanglement)
        self:resistances():add(RPD.ItemFactory:itemByName("WandOfFirebolt"))
        self:resistances():add(RPD.ItemFactory:itemByName("WandOfMagicMissile"))
    end
}