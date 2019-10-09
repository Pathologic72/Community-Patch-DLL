-- Charitable Missions (Now Missionary Influence)
UPDATE Beliefs
SET CityStateInfluenceModifier = '0'
WHERE Type = 'BELIEF_CHARITABLE_MISSIONS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

-- Evangelism (Now Crusader Zeal)
UPDATE Beliefs
SET OtherReligionPressureErosion = '0'
WHERE Type = 'BELIEF_EVANGELISM' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

UPDATE Beliefs
SET CombatVersusOtherReligionTheirLands = '20'
WHERE Type = 'BELIEF_EVANGELISM' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

-- Defender Faith
UPDATE Beliefs
SET CombatModifierFriendlyCities = '0'
WHERE Type = 'BELIEF_DEFENDER_FAITH' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

UPDATE Beliefs
SET CombatVersusOtherReligionOwnLands = '20'
WHERE Type = 'BELIEF_DEFENDER_FAITH' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

UPDATE Beliefs
SET Enhancer = '0'
WHERE Type = 'BELIEF_DEFENDER_FAITH' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

UPDATE Beliefs
SET Reformation = '1'
WHERE Type = 'BELIEF_DEFENDER_FAITH' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

-- Jesuit Education 
INSERT INTO Belief_BuildingClassYieldChanges
	(BeliefType, BuildingClassType, YieldType, YieldChange)
VALUES
	('BELIEF_JESUIT_EDUCATION', 'BUILDINGCLASS_UNIVERSITY', 'YIELD_SCIENCE', 2),
	('BELIEF_JESUIT_EDUCATION', 'BUILDINGCLASS_PUBLIC_SCHOOL', 'YIELD_SCIENCE', 2),
	('BELIEF_JESUIT_EDUCATION', 'BUILDINGCLASS_LABORATORY', 'YIELD_SCIENCE', 2);

UPDATE Beliefs
SET GreatPersonExpendedFaith = '20'
WHERE Type = 'BELIEF_JESUIT_EDUCATION' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

-- Religious Fervor (Now The One True Faith)
DELETE FROM Belief_EraFaithUnitPurchase
WHERE BeliefType = 'BELIEF_RELIGIOUS_FERVOR' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

INSERT INTO Belief_VotePerXImprovementOwned
	(BeliefType, ImprovementType, Amount)
VALUES
	('BELIEF_RELIGIOUS_FERVOR', 'IMPROVEMENT_HOLY_SITE', 2),
	('BELIEF_RELIGIOUS_FERVOR', 'IMPROVEMENT_LANDMARK', 2);

UPDATE Beliefs
SET OtherReligionPressureErosion = '0'
WHERE Type = 'BELIEF_RELIGIOUS_FERVOR' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

UPDATE Beliefs
SET CSYieldBonusFromSharedReligion = '50'
WHERE Type = 'BELIEF_RELIGIOUS_FERVOR' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

-- Sacred Sites
UPDATE Beliefs
SET FaithBuildingTourism = '3'
WHERE Type = 'BELIEF_SACRED_SITES' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

INSERT INTO Belief_YieldChangeWorldWonder
	(BeliefType, YieldType, Yield)
VALUES
	('BELIEF_SACRED_SITES', 'YIELD_TOURISM', 4);

INSERT INTO Belief_YieldChangeNaturalWonder
	(BeliefType, YieldType, Yield)
VALUES
	('BELIEF_SACRED_SITES', 'YIELD_TOURISM', 4);

-- Glory of God

-- Underground Sect (Now Faith of the  Masses)
UPDATE Beliefs
SET SpyPressure = '0'
WHERE Type = 'BELIEF_UNDERGROUND_SECT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

UPDATE Buildings
SET UnlockedByBelief = '1'
WHERE BuildingClass = 'BUILDINGCLASS_OPERA_HOUSE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

UPDATE Buildings
SET UnlockedByBelief = '1'
WHERE BuildingClass = 'BUILDINGCLASS_MUSEUM' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

UPDATE Buildings
SET UnlockedByBelief = '1'
WHERE BuildingClass = 'BUILDINGCLASS_BROADCAST_TOWER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

UPDATE Buildings
SET UnlockedByBelief = '1'
WHERE BuildingClass = 'BUILDINGCLASS_AMPHITHEATER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

UPDATE Buildings
SET UnlockedByBelief = '1'
WHERE BuildingClass = 'BUILDINGCLASS_STADIUM' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );


INSERT INTO Belief_BuildingClassYieldChanges
	(BeliefType, BuildingClassType, YieldType, YieldChange)
VALUES
	('BELIEF_UNDERGROUND_SECT', 'BUILDINGCLASS_AMPHITHEATER', 'YIELD_CULTURE', 2),
	('BELIEF_UNDERGROUND_SECT', 'BUILDINGCLASS_OPERA_HOUSE', 'YIELD_CULTURE', 2),
	('BELIEF_UNDERGROUND_SECT', 'BUILDINGCLASS_MUSEUM', 'YIELD_CULTURE', 2),
	('BELIEF_UNDERGROUND_SECT', 'BUILDINGCLASS_BROADCAST_TOWER', 'YIELD_CULTURE', 2),
	('BELIEF_UNDERGROUND_SECT', 'BUILDINGCLASS_STADIUM', 'YIELD_CULTURE', 2);


UPDATE Beliefs
SET HappinessPerFollowingCity = '0.5'
WHERE Type = 'BELIEF_UNDERGROUND_SECT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

-- Unity of the Prophets (Now Knowledge Through Faith)

UPDATE Beliefs
SET InquisitorPressureRetention = '0'
WHERE Type = 'BELIEF_UNITY_OF_PROPHETS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

-- NEW DATA

INSERT INTO Belief_BuildingClassFaithPurchase
	(BeliefType, BuildingClassType)
VALUES
	('BELIEF_UNDERGROUND_SECT', 'BUILDINGCLASS_AMPHITHEATER'),
	('BELIEF_UNDERGROUND_SECT', 'BUILDINGCLASS_OPERA_HOUSE'),
	('BELIEF_UNDERGROUND_SECT', 'BUILDINGCLASS_MUSEUM'),
	('BELIEF_UNDERGROUND_SECT', 'BUILDINGCLASS_BROADCAST_TOWER'),
	('BELIEF_UNDERGROUND_SECT', 'BUILDINGCLASS_STADIUM');

INSERT INTO Belief_BuildingClassTourism
	(BeliefType, BuildingClassType, Tourism)
VALUES
	('BELIEF_SACRED_SITES', 'BUILDINGCLASS_HERMITAGE', 10),
	('BELIEF_SACRED_SITES', 'BUILDINGCLASS_HOTEL', 3);

INSERT INTO Belief_GreatWorkYieldChanges(BeliefType, YieldType, Yield)
VALUES
	('BELIEF_UNITY_OF_PROPHETS', 'YIELD_CULTURE', 2);

INSERT INTO Belief_BuildingClassYieldChanges
	(BeliefType, BuildingClassType, YieldType, YieldChange)
VALUES
	('BELIEF_SACRED_SITES', 'BUILDINGCLASS_HERMITAGE', 'YIELD_CULTURE', 10),
	('BELIEF_DEFENDER_FAITH', 'BUILDINGCLASS_WALLS', 'YIELD_FAITH', 2),
	('BELIEF_DEFENDER_FAITH', 'BUILDINGCLASS_CASTLE', 'YIELD_FAITH', 2),
	('BELIEF_DEFENDER_FAITH', 'BUILDINGCLASS_ARSENAL', 'YIELD_FAITH', 2),
	('BELIEF_DEFENDER_FAITH', 'BUILDINGCLASS_MILITARY_BASE', 'YIELD_FAITH', 2),
	('BELIEF_DEFENDER_FAITH', 'BUILDINGCLASS_BOMB_SHELTER', 'YIELD_FAITH', 2),
	('BELIEF_DEFENDER_FAITH', 'BUILDINGCLASS_WALLS', 'YIELD_CULTURE', 3),
	('BELIEF_DEFENDER_FAITH', 'BUILDINGCLASS_CASTLE', 'YIELD_CULTURE', 3),
	('BELIEF_DEFENDER_FAITH', 'BUILDINGCLASS_ARSENAL', 'YIELD_CULTURE', 3),
	('BELIEF_DEFENDER_FAITH', 'BUILDINGCLASS_MILITARY_BASE', 'YIELD_CULTURE', 3),
	('BELIEF_DEFENDER_FAITH', 'BUILDINGCLASS_BOMB_SHELTER', 'YIELD_CULTURE', 3);

INSERT INTO Belief_ImprovementYieldChanges
	(BeliefType, ImprovementType, YieldType, Yield)
VALUES
	('BELIEF_UNITY_OF_PROPHETS', 'IMPROVEMENT_ACADEMY', 'YIELD_FAITH', 4),
	('BELIEF_UNITY_OF_PROPHETS', 'IMPROVEMENT_HOLY_SITE', 'YIELD_FAITH', 4),
	('BELIEF_UNITY_OF_PROPHETS', 'IMPROVEMENT_CUSTOMS_HOUSE', 'YIELD_FAITH', 4),
	('BELIEF_UNITY_OF_PROPHETS', 'IMPROVEMENT_MANUFACTORY', 'YIELD_FAITH', 4),
	('BELIEF_UNITY_OF_PROPHETS', 'IMPROVEMENT_CITADEL', 'YIELD_FAITH', 4),
	('BELIEF_UNITY_OF_PROPHETS', 'IMPROVEMENT_LANDMARK', 'YIELD_FAITH', 4),
	('BELIEF_UNITY_OF_PROPHETS', 'IMPROVEMENT_ACADEMY', 'YIELD_SCIENCE', 4),
	('BELIEF_UNITY_OF_PROPHETS', 'IMPROVEMENT_HOLY_SITE', 'YIELD_SCIENCE', 4),
	('BELIEF_UNITY_OF_PROPHETS', 'IMPROVEMENT_CUSTOMS_HOUSE', 'YIELD_SCIENCE', 4),
	('BELIEF_UNITY_OF_PROPHETS', 'IMPROVEMENT_MANUFACTORY', 'YIELD_SCIENCE', 4),
	('BELIEF_UNITY_OF_PROPHETS', 'IMPROVEMENT_CITADEL', 'YIELD_SCIENCE', 4),
	('BELIEF_UNITY_OF_PROPHETS', 'IMPROVEMENT_LANDMARK', 'YIELD_SCIENCE', 4);

INSERT INTO Belief_SpecificFaithUnitPurchase
	(BeliefType, UnitType)
VALUES
	('BELIEF_UNITY_OF_PROPHETS', 'UNIT_ARCHAEOLOGIST');

INSERT INTO Belief_YieldFromConquest
	(BeliefType, YieldType, Yield)
VALUES
	('BELIEF_EVANGELISM', 'YIELD_CULTURE', 50),
	('BELIEF_EVANGELISM', 'YIELD_GOLD', 50);

INSERT INTO Belief_GreatPersonExpendedYield
	(BeliefType, GreatPersonType, YieldType, Yield)
VALUES
	('BELIEF_TO_GLORY_OF_GOD', 'GREATPERSON_SCIENTIST', 'YIELD_SCIENCE', 3),
	('BELIEF_TO_GLORY_OF_GOD', 'GREATPERSON_SCIENTIST', 'YIELD_GOLD', 3),
	('BELIEF_TO_GLORY_OF_GOD', 'GREATPERSON_SCIENTIST', 'YIELD_CULTURE', 3),
	('BELIEF_TO_GLORY_OF_GOD', 'GREATPERSON_ENGINEER', 'YIELD_SCIENCE', 3),
	('BELIEF_TO_GLORY_OF_GOD', 'GREATPERSON_ENGINEER', 'YIELD_GOLD', 3),
	('BELIEF_TO_GLORY_OF_GOD', 'GREATPERSON_ENGINEER', 'YIELD_CULTURE', 3),
	('BELIEF_TO_GLORY_OF_GOD', 'GREATPERSON_PROPHET', 'YIELD_SCIENCE', 3),
	('BELIEF_TO_GLORY_OF_GOD', 'GREATPERSON_PROPHET', 'YIELD_GOLD', 3),
	('BELIEF_TO_GLORY_OF_GOD', 'GREATPERSON_PROPHET', 'YIELD_CULTURE', 3),
	('BELIEF_TO_GLORY_OF_GOD', 'GREATPERSON_GENERAL', 'YIELD_SCIENCE', 3),
	('BELIEF_TO_GLORY_OF_GOD', 'GREATPERSON_GENERAL', 'YIELD_GOLD', 3),
	('BELIEF_TO_GLORY_OF_GOD', 'GREATPERSON_GENERAL', 'YIELD_CULTURE', 3),
	('BELIEF_TO_GLORY_OF_GOD', 'GREATPERSON_ADMIRAL', 'YIELD_SCIENCE', 3),
	('BELIEF_TO_GLORY_OF_GOD', 'GREATPERSON_ADMIRAL', 'YIELD_GOLD', 3),
	('BELIEF_TO_GLORY_OF_GOD', 'GREATPERSON_ADMIRAL', 'YIELD_CULTURE', 3),
	('BELIEF_TO_GLORY_OF_GOD', 'GREATPERSON_MERCHANT', 'YIELD_SCIENCE', 3),
	('BELIEF_TO_GLORY_OF_GOD', 'GREATPERSON_MERCHANT', 'YIELD_GOLD', 3),
	('BELIEF_TO_GLORY_OF_GOD', 'GREATPERSON_MERCHANT', 'YIELD_CULTURE', 3),
	('BELIEF_TO_GLORY_OF_GOD', 'GREATPERSON_ARTIST', 'YIELD_SCIENCE', 3),
	('BELIEF_TO_GLORY_OF_GOD', 'GREATPERSON_ARTIST', 'YIELD_GOLD', 3),
	('BELIEF_TO_GLORY_OF_GOD', 'GREATPERSON_ARTIST', 'YIELD_CULTURE', 3),
	('BELIEF_TO_GLORY_OF_GOD', 'GREATPERSON_MUSICIAN', 'YIELD_SCIENCE', 3),
	('BELIEF_TO_GLORY_OF_GOD', 'GREATPERSON_MUSICIAN', 'YIELD_GOLD', 3),
	('BELIEF_TO_GLORY_OF_GOD', 'GREATPERSON_MUSICIAN', 'YIELD_CULTURE', 3),
	('BELIEF_TO_GLORY_OF_GOD', 'GREATPERSON_WRITER', 'YIELD_SCIENCE', 3),
	('BELIEF_TO_GLORY_OF_GOD', 'GREATPERSON_WRITER', 'YIELD_GOLD', 3),
	('BELIEF_TO_GLORY_OF_GOD', 'GREATPERSON_WRITER', 'YIELD_CULTURE', 3);

INSERT INTO Belief_YieldFromHost
	(BeliefType, YieldType, Yield)
VALUES
	('BELIEF_CHARITABLE_MISSIONS', 'YIELD_CULTURE', 10),
	('BELIEF_CHARITABLE_MISSIONS', 'YIELD_SCIENCE', 10),
	('BELIEF_CHARITABLE_MISSIONS', 'YIELD_FAITH', 10),
	('BELIEF_CHARITABLE_MISSIONS', 'YIELD_GOLD', 10),
	('BELIEF_CHARITABLE_MISSIONS', 'YIELD_GOLDEN_AGE_POINTS', 10);

INSERT INTO Belief_YieldFromProposal
	(BeliefType, YieldType, Yield)
VALUES
	('BELIEF_CHARITABLE_MISSIONS', 'YIELD_CULTURE', 150),
	('BELIEF_CHARITABLE_MISSIONS', 'YIELD_SCIENCE', 150),
	('BELIEF_CHARITABLE_MISSIONS', 'YIELD_FAITH', 150),
	('BELIEF_CHARITABLE_MISSIONS', 'YIELD_GOLD', 150),
	('BELIEF_CHARITABLE_MISSIONS', 'YIELD_GOLDEN_AGE_POINTS', 150);



UPDATE Beliefs
SET Tooltip = 'TXT_KEY_BELIEF_UNITY_OF_PROPHETS'
WHERE Type = 'BELIEF_UNITY_OF_PROPHETS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

UPDATE Beliefs
SET Tooltip = 'TXT_KEY_BELIEF_UNDERGROUND_SECT'
WHERE Type = 'BELIEF_UNDERGROUND_SECT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

UPDATE Beliefs
SET Tooltip = 'TXT_KEY_BELIEF_TO_GLORY_OF_GOD'
WHERE Type = 'BELIEF_TO_GLORY_OF_GOD' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

UPDATE Beliefs
SET Tooltip = 'TXT_KEY_BELIEF_SACRED_SITES'
WHERE Type = 'BELIEF_SACRED_SITES' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

UPDATE Beliefs
SET Tooltip = 'TXT_KEY_BELIEF_RELIGIOUS_FERVOR'
WHERE Type = 'BELIEF_RELIGIOUS_FERVOR' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

UPDATE Beliefs
SET Tooltip = 'TXT_KEY_BELIEF_JESUIT_EDUCATION'
WHERE Type = 'BELIEF_JESUIT_EDUCATION' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

UPDATE Beliefs
SET Tooltip = 'TXT_KEY_BELIEF_EVANGELISM'
WHERE Type = 'BELIEF_EVANGELISM' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

UPDATE Beliefs
SET Tooltip = 'TXT_KEY_BELIEF_CHARITABLE_MISSIONS'
WHERE Type = 'BELIEF_CHARITABLE_MISSIONS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

UPDATE Beliefs
SET Tooltip = 'TXT_KEY_BELIEF_DEFENDER_FAITH'
WHERE Type = 'BELIEF_DEFENDER_FAITH' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );
