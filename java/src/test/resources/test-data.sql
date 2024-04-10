BEGIN TRANSACTION;

-- Users
INSERT INTO users (username,password_hash,role) VALUES ('user1','user1','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('user2','user2','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('user3','user3','ROLE_USER');


--Intents and associated keywords
INSERT INTO intent(name) VALUES ('DEFAULT INTENT');  -- ID 1
INSERT INTO keyword(keyword, intent_id, entity_id) VALUES ('intent1keyword', 1, NULL);
INSERT INTO keyword(keyword, intent_id, entity_id) VALUES ('intent1keyword2', 1, NULL);

INSERT INTO intent(name) VALUES ('Intent2');  -- ID 2
INSERT INTO keyword(keyword, intent_id, entity_id) VALUES ('intent2keyword', 2, NULL);

INSERT INTO intent(name) VALUES ('Intent3');  -- ID 3, DO NOT MAKE CATCH ALL
INSERT INTO keyword(keyword, intent_id, entity_id) VALUES ('intent3keyword', 3, NULL);

INSERT INTO intent(name) VALUES ('Intent4'); -- ID 4 -- ID FOR PRACTICE, RESPONSES WILL BE RANDOM
INSERT INTO keyword(keyword, intent_id, entity_id) VALUES ('intent4keyword', 4, NULL);

INSERT INTO intent(name) VALUES ('Intent5');  -- ID 5
INSERT INTO keyword(keyword, intent_id, entity_id) VALUES ('intent5keyword', 5, NULL);

INSERT INTO intent(name) VALUES ('Intent6');  -- ID 6
INSERT INTO keyword(keyword, intent_id, entity_id) VALUES ('intent6keyword', 6, NULL);

INSERT INTO intent(name) VALUES ('Intent7'); -- ID 7 (only links to default entity)
INSERT INTO keyword(keyword, intent_id, entity_id) VALUES ('intent7keyword', 7, NULL);


--Entities and associated keywords
INSERT INTO entity(name) VALUES ('DEFAULT ENTITY');  -- ID 1
INSERT INTO keyword(keyword, intent_id, entity_id) VALUES ('entity1keyword', NULL, 1);

INSERT INTO entity(name) VALUES ('Entity2');  -- ID 2
INSERT INTO keyword(keyword, intent_id, entity_id) VALUES ('entity2keyword', NULL, 2);

INSERT INTO entity(name) VALUES ('Entity3');  -- ID 3
INSERT INTO keyword(keyword, intent_id, entity_id) VALUES ('entity3keyword', NULL, 3);
INSERT INTO keyword(keyword, intent_id, entity_id) VALUES ('Two-word keyword', NULL, 3);
INSERT INTO keyword(keyword, intent_id, entity_id) VALUES ('The Longest Multiple Word Keyword', NULL, 3);

INSERT INTO entity(name) VALUES ('Entity4');  -- ID 4, DO NOT MAKE CATCH-ALL
INSERT INTO keyword(keyword, intent_id, entity_id) VALUES ('entity4keyword', NULL, 4);
INSERT INTO keyword(keyword, intent_id, entity_id) VALUES ('Multiple Word Keyword', NULL, 4);

INSERT INTO entity(name) VALUES ('Entity5');  -- ID 5
INSERT INTO keyword(keyword, intent_id, entity_id) VALUES ('entity5keyword', NULL, 5);

INSERT INTO entity(name) VALUES ('Entity6');  -- ID 6
INSERT INTO keyword(keyword, intent_id, entity_id) VALUES ('entity6keyword', NULL, 6);

INSERT INTO entity(name) VALUES ('Entity7');  -- ID 7 -- corresponds with HR Interview
INSERT INTO keyword(keyword, intent_id, entity_id) VALUES ('entity7keyword', NULL, 7);

INSERT INTO entity(name) VALUES ('Entity8');  -- ID 8 -- corresponds with technical interview
INSERT INTO keyword(keyword, intent_id, entity_id) VALUES ('entity8keyword', NULL, 8);



--Responses and join tables
INSERT INTO response(response, name) VALUES ('Test Response 1', 'Name 1'); -- ID 1, joined to Default intent and entity
INSERT INTO response_intent(response_id, intent_id) VALUES (1, 1);  -- the catch-all response
INSERT INTO response_entity(response_id, entity_id) VALUES (1, 1);

INSERT INTO response(response, name) VALUES ('Test Response 2', 'Name 2'); -- ID 2, joined to default intent and Entity 2
INSERT INTO response_intent(response_id, intent_id) VALUES (2, 1);  -- Entity 2 catch all
INSERT INTO response_entity(response_id, entity_id) VALUES (2, 2);

INSERT INTO response(response, name) VALUES ('Test Response 3', 'Name 3'); -- ID 3, joined to intent 2 and entity 4
INSERT INTO response_intent(response_id, intent_id) VALUES (3, 2);
INSERT INTO response_entity(response_id, entity_id) VALUES (3, 4);

INSERT INTO response(response, name) VALUES ('Test Response 4', 'Name 4'); -- ID 4, joined to intent 2 and entities 2 and 3
INSERT INTO response_intent(response_id, intent_id) VALUES (4, 2); -- TEST RELIES ON NO OTHER RESPONSES IN intent 2 / entity 3
INSERT INTO response_entity(response_id, entity_id) VALUES (4, 2); -- having 3 matches
INSERT INTO response_entity(response_id, entity_id) VALUES (4, 3);

INSERT INTO response(response, name) VALUES ('Test Response 5', 'Name 5'); -- ID 5, joined to intent 3 and entity 2
INSERT INTO response_intent(response_id, intent_id) VALUES (5, 3);  -- TEST RELIES ON NO OTHER RESPONSES HAVING THIS
INSERT INTO response_entity(response_id, entity_id) VALUES (5, 2);  --     intent/entity pairing

INSERT INTO response(response, name) VALUES ('Test Response 6', 'Name 6'); -- ID 6, joined to intent 2 and entity 3
INSERT INTO response_intent(response_id, intent_id) VALUES (6, 2);
INSERT INTO response_entity(response_id, entity_id) VALUES (6, 3);

INSERT INTO response(response, name) VALUES ('Intent 7 Catch-All', 'Name 7'); -- ID 7, joined to intent 7 and default entity
INSERT INTO response_intent(response_id, intent_id) VALUES (7, 7);  -- DO NOT ATTACH ANYTHING TO INTENT 7
INSERT INTO response_entity(response_id, entity_id) VALUES (7, 1);

INSERT INTO response(response, name) VALUES ('Test Response 8', 'Name 8'); -- ID 8 join to intent 5 and entity 2 and 3
INSERT INTO response_intent(response_id, intent_id) VALUES (8, 5);
INSERT INTO response_entity(response_id, entity_id) VALUES (8, 2);
INSERT INTO response_entity(response_id, entity_id) VALUES (8, 3);

INSERT INTO response(response, name) VALUES ('Test Response 9', 'Name 9'); -- ID 9 join to intent 6 and entity 2 and 3
INSERT INTO response_intent(response_id, intent_id) VALUES (9, 6);
INSERT INTO response_entity(response_id, entity_id) VALUES (9, 2);
INSERT INTO response_entity(response_id, entity_id) VALUES (9, 3);

INSERT INTO response(response, name) VALUES ('Test Response 10', 'Name 10'); -- ID 10, practice HR interview
INSERT INTO response_intent(response_id, intent_id) VALUES (10, 4);
INSERT INTO response_entity(response_id, entity_id) VALUES (10, 7);

INSERT INTO response(response, name) VALUES ('Test Response 11', 'Name 11'); -- ID 11, practice HR interview
INSERT INTO response_intent(response_id, intent_id) VALUES (11, 4);
INSERT INTO response_entity(response_id, entity_id) VALUES (11, 7);

INSERT INTO response(response, name) VALUES ('Test Response 12', 'Name 12'); -- ID 12, practice HR interview
INSERT INTO response_intent(response_id, intent_id) VALUES (12, 4);
INSERT INTO response_entity(response_id, entity_id) VALUES (12, 7);

INSERT INTO response(response, name) VALUES ('Test Response 13', 'Name 13'); -- ID 13, practice HR interview
INSERT INTO response_intent(response_id, intent_id) VALUES (13, 4);
INSERT INTO response_entity(response_id, entity_id) VALUES (13, 7);

INSERT INTO response(response, name) VALUES ('Test Response 14', 'Name 14'); -- ID 14, practice HR interview
INSERT INTO response_intent(response_id, intent_id) VALUES (14, 4);
INSERT INTO response_entity(response_id, entity_id) VALUES (14, 7);

INSERT INTO response(response, name) VALUES ('Test Response 15', 'Name 15'); -- ID 15, practice Technical interview
INSERT INTO response_intent(response_id, intent_id) VALUES (15, 4);
INSERT INTO response_entity(response_id, entity_id) VALUES (15, 8);

INSERT INTO response(response, name) VALUES ('Test Response 16', 'Name 16'); -- ID 16, practice Technical interview
INSERT INTO response_intent(response_id, intent_id) VALUES (16, 4);
INSERT INTO response_entity(response_id, entity_id) VALUES (16, 8);

INSERT INTO response(response, name) VALUES ('Test Response 17', 'Name 17'); -- ID 17, practice Technical interview
INSERT INTO response_intent(response_id, intent_id) VALUES (17, 4);
INSERT INTO response_entity(response_id, entity_id) VALUES (17, 8);

INSERT INTO response(response, name) VALUES ('Test Response 18', 'Name 18'); -- ID 18, practice Technical interview
INSERT INTO response_intent(response_id, intent_id) VALUES (18, 4);
INSERT INTO response_entity(response_id, entity_id) VALUES (18, 8);

INSERT INTO response(response, name) VALUES ('Test Response 19', 'Name 19'); -- ID 19, practice Technical interview
INSERT INTO response_intent(response_id, intent_id) VALUES (19, 4);
INSERT INTO response_entity(response_id, entity_id) VALUES (19, 8);

COMMIT TRANSACTION;
