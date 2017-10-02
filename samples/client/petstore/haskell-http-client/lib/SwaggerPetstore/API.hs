{-|
Module : SwaggerPetstore.API
-}

{-# LANGUAGE RecordWildCards #-}

{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE InstanceSigs #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# OPTIONS_GHC -fno-warn-name-shadowing -fno-warn-unused-binds -fno-warn-unused-imports #-}

module SwaggerPetstore.API where


import SwaggerPetstore.Model as M
import SwaggerPetstore.MimeTypes
import SwaggerPetstore.Lens

import qualified Data.Aeson as A

import qualified Data.Time as TI

import qualified Data.ByteString as B
import qualified Data.ByteString.Lazy as BL
import qualified Data.ByteString.Builder as BB
import qualified Data.ByteString.Char8 as BC
import qualified Data.ByteString.Lazy.Char8 as BCL

import qualified Network.HTTP.Client.MultipartFormData as NH
import qualified Network.HTTP.Media as ME
import qualified Network.HTTP.Types as NH

import qualified Web.HttpApiData as WH
import qualified Web.FormUrlEncoded as WH

import qualified Data.CaseInsensitive as CI
import qualified Data.Data as P (Typeable)
import qualified Data.Foldable as P
import qualified Data.Map as Map
import qualified Data.Set as Set
import qualified Data.Maybe as P
import qualified Data.Proxy as P (Proxy(..))
import qualified Data.Text as T
import qualified Data.Text.Encoding as T
import qualified Data.Text.Lazy as TL
import qualified Data.Text.Lazy.Encoding as TL
import qualified GHC.Base as P (Alternative)
import qualified Control.Arrow as P (left)

import qualified Lens.Micro as L

import Data.Monoid ((<>))
import Data.Function ((&))
import Data.Text (Text)
import GHC.Base ((<|>))

import Prelude ((==),(/=),($), (.),(<$>),(<*>),(>>=),Maybe(..),Bool(..),Char,Double,FilePath,Float,Int,Integer,String,fmap,undefined,mempty,maybe,pure,Monad,Applicative,Functor)
import qualified Prelude as P

-- * Operations


-- ** AnotherFake

-- *** testSpecialTags

-- | @PATCH \/another-fake\/dummy@
-- 
-- To test special tags
-- 
-- To test special tags
-- 
testSpecialTags 
  :: (Consumes TestSpecialTags contentType, MimeRender contentType Client)
  => contentType -- ^ request content-type ('MimeType')
  -> Client -- ^ "body" -  client model
  -> SwaggerPetstoreRequest TestSpecialTags contentType Client
testSpecialTags _ body =
  _mkRequest "PATCH" ["/another-fake/dummy"]
    `setBodyParam` body

data TestSpecialTags 

-- | /Body Param/ "body" - client model
instance HasBodyParam TestSpecialTags Client 

-- | @application/json@
instance Consumes TestSpecialTags MimeJSON

-- | @application/json@
instance Produces TestSpecialTags MimeJSON


-- ** Fake

-- *** fakeOuterBooleanSerialize

-- | @POST \/fake\/outer\/boolean@
-- 
-- Test serialization of outer boolean types
-- 
fakeOuterBooleanSerialize 
  :: (Consumes FakeOuterBooleanSerialize contentType)
  => contentType -- ^ request content-type ('MimeType')
  -> SwaggerPetstoreRequest FakeOuterBooleanSerialize contentType OuterBoolean
fakeOuterBooleanSerialize _ =
  _mkRequest "POST" ["/fake/outer/boolean"]

data FakeOuterBooleanSerialize 

-- | /Body Param/ "body" - Input boolean as post body
instance HasBodyParam FakeOuterBooleanSerialize OuterBoolean 

-- *** fakeOuterCompositeSerialize

-- | @POST \/fake\/outer\/composite@
-- 
-- Test serialization of object with outer number type
-- 
fakeOuterCompositeSerialize 
  :: (Consumes FakeOuterCompositeSerialize contentType)
  => contentType -- ^ request content-type ('MimeType')
  -> SwaggerPetstoreRequest FakeOuterCompositeSerialize contentType OuterComposite
fakeOuterCompositeSerialize _ =
  _mkRequest "POST" ["/fake/outer/composite"]

data FakeOuterCompositeSerialize 

-- | /Body Param/ "body" - Input composite as post body
instance HasBodyParam FakeOuterCompositeSerialize OuterComposite 

-- *** fakeOuterNumberSerialize

-- | @POST \/fake\/outer\/number@
-- 
-- Test serialization of outer number types
-- 
fakeOuterNumberSerialize 
  :: (Consumes FakeOuterNumberSerialize contentType)
  => contentType -- ^ request content-type ('MimeType')
  -> SwaggerPetstoreRequest FakeOuterNumberSerialize contentType OuterNumber
fakeOuterNumberSerialize _ =
  _mkRequest "POST" ["/fake/outer/number"]

data FakeOuterNumberSerialize 

-- | /Body Param/ "body" - Input number as post body
instance HasBodyParam FakeOuterNumberSerialize OuterNumber 

-- *** fakeOuterStringSerialize

-- | @POST \/fake\/outer\/string@
-- 
-- Test serialization of outer string types
-- 
fakeOuterStringSerialize 
  :: (Consumes FakeOuterStringSerialize contentType)
  => contentType -- ^ request content-type ('MimeType')
  -> SwaggerPetstoreRequest FakeOuterStringSerialize contentType OuterString
fakeOuterStringSerialize _ =
  _mkRequest "POST" ["/fake/outer/string"]

data FakeOuterStringSerialize 

-- | /Body Param/ "body" - Input string as post body
instance HasBodyParam FakeOuterStringSerialize OuterString 

-- *** testClientModel

-- | @PATCH \/fake@
-- 
-- To test \"client\" model
-- 
-- To test \"client\" model
-- 
testClientModel 
  :: (Consumes TestClientModel contentType, MimeRender contentType Client)
  => contentType -- ^ request content-type ('MimeType')
  -> Client -- ^ "body" -  client model
  -> SwaggerPetstoreRequest TestClientModel contentType Client
testClientModel _ body =
  _mkRequest "PATCH" ["/fake"]
    `setBodyParam` body

data TestClientModel 

-- | /Body Param/ "body" - client model
instance HasBodyParam TestClientModel Client 

-- | @application/json@
instance Consumes TestClientModel MimeJSON

-- | @application/json@
instance Produces TestClientModel MimeJSON


-- *** testEndpointParameters

-- | @POST \/fake@
-- 
-- Fake endpoint for testing various parameters 假端點 偽のエンドポイント 가짜 엔드 포인트 
-- 
-- Fake endpoint for testing various parameters 假端點 偽のエンドポイント 가짜 엔드 포인트 
-- 
-- AuthMethod: http_basic_test
-- 
-- Note: Has 'Produces' instances, but no response schema
-- 
testEndpointParameters 
  :: (Consumes TestEndpointParameters contentType)
  => contentType -- ^ request content-type ('MimeType')
  -> Double -- ^ "number" -  None
  -> Double -- ^ "double" -  None
  -> Text -- ^ "patternWithoutDelimiter" -  None
  -> ByteArray -- ^ "byte" -  None
  -> SwaggerPetstoreRequest TestEndpointParameters contentType res
testEndpointParameters _ number double patternWithoutDelimiter byte =
  _mkRequest "POST" ["/fake"]
    `_addForm` toForm ("number", number)
    `_addForm` toForm ("double", double)
    `_addForm` toForm ("pattern_without_delimiter", patternWithoutDelimiter)
    `_addForm` toForm ("byte", byte)

data TestEndpointParameters  

-- | /Optional Param/ "integer" - None
instance HasOptionalParam TestEndpointParameters ParamInteger where
  applyOptionalParam req (ParamInteger xs) =
    req `_addForm` toForm ("integer", xs)

-- | /Optional Param/ "int32" - None
instance HasOptionalParam TestEndpointParameters Int32 where
  applyOptionalParam req (Int32 xs) =
    req `_addForm` toForm ("int32", xs)

-- | /Optional Param/ "int64" - None
instance HasOptionalParam TestEndpointParameters Int64 where
  applyOptionalParam req (Int64 xs) =
    req `_addForm` toForm ("int64", xs)

-- | /Optional Param/ "float" - None
instance HasOptionalParam TestEndpointParameters ParamFloat where
  applyOptionalParam req (ParamFloat xs) =
    req `_addForm` toForm ("float", xs)

-- | /Optional Param/ "string" - None
instance HasOptionalParam TestEndpointParameters ParamString where
  applyOptionalParam req (ParamString xs) =
    req `_addForm` toForm ("string", xs)

-- | /Optional Param/ "binary" - None
instance HasOptionalParam TestEndpointParameters ParamBinary where
  applyOptionalParam req (ParamBinary xs) =
    req `_addForm` toForm ("binary", xs)

-- | /Optional Param/ "date" - None
instance HasOptionalParam TestEndpointParameters ParamDate where
  applyOptionalParam req (ParamDate xs) =
    req `_addForm` toForm ("date", xs)

-- | /Optional Param/ "dateTime" - None
instance HasOptionalParam TestEndpointParameters ParamDateTime where
  applyOptionalParam req (ParamDateTime xs) =
    req `_addForm` toForm ("dateTime", xs)

-- | /Optional Param/ "password" - None
instance HasOptionalParam TestEndpointParameters Password where
  applyOptionalParam req (Password xs) =
    req `_addForm` toForm ("password", xs)

-- | /Optional Param/ "callback" - None
instance HasOptionalParam TestEndpointParameters Callback where
  applyOptionalParam req (Callback xs) =
    req `_addForm` toForm ("callback", xs)

-- | @application/xml; charset=utf-8@
instance Consumes TestEndpointParameters MimeXmlCharsetutf8
-- | @application/json; charset=utf-8@
instance Consumes TestEndpointParameters MimeJsonCharsetutf8

-- | @application/xml; charset=utf-8@
instance Produces TestEndpointParameters MimeXmlCharsetutf8
-- | @application/json; charset=utf-8@
instance Produces TestEndpointParameters MimeJsonCharsetutf8


-- *** testEnumParameters

-- | @GET \/fake@
-- 
-- To test enum parameters
-- 
-- To test enum parameters
-- 
-- Note: Has 'Produces' instances, but no response schema
-- 
testEnumParameters 
  :: (Consumes TestEnumParameters contentType)
  => contentType -- ^ request content-type ('MimeType')
  -> SwaggerPetstoreRequest TestEnumParameters contentType res
testEnumParameters _ =
  _mkRequest "GET" ["/fake"]

data TestEnumParameters  

-- | /Optional Param/ "enum_form_string_array" - Form parameter enum test (string array)
instance HasOptionalParam TestEnumParameters EnumFormStringArray where
  applyOptionalParam req (EnumFormStringArray xs) =
    req `_addForm` toFormColl CommaSeparated ("enum_form_string_array", xs)

-- | /Optional Param/ "enum_form_string" - Form parameter enum test (string)
instance HasOptionalParam TestEnumParameters EnumFormString where
  applyOptionalParam req (EnumFormString xs) =
    req `_addForm` toForm ("enum_form_string", xs)

-- | /Optional Param/ "enum_header_string_array" - Header parameter enum test (string array)
instance HasOptionalParam TestEnumParameters EnumHeaderStringArray where
  applyOptionalParam req (EnumHeaderStringArray xs) =
    req `setHeader` toHeaderColl CommaSeparated ("enum_header_string_array", xs)

-- | /Optional Param/ "enum_header_string" - Header parameter enum test (string)
instance HasOptionalParam TestEnumParameters EnumHeaderString where
  applyOptionalParam req (EnumHeaderString xs) =
    req `setHeader` toHeader ("enum_header_string", xs)

-- | /Optional Param/ "enum_query_string_array" - Query parameter enum test (string array)
instance HasOptionalParam TestEnumParameters EnumQueryStringArray where
  applyOptionalParam req (EnumQueryStringArray xs) =
    req `_setQuery` toQueryColl CommaSeparated ("enum_query_string_array", Just xs)

-- | /Optional Param/ "enum_query_string" - Query parameter enum test (string)
instance HasOptionalParam TestEnumParameters EnumQueryString where
  applyOptionalParam req (EnumQueryString xs) =
    req `_setQuery` toQuery ("enum_query_string", Just xs)

-- | /Optional Param/ "enum_query_integer" - Query parameter enum test (double)
instance HasOptionalParam TestEnumParameters EnumQueryInteger where
  applyOptionalParam req (EnumQueryInteger xs) =
    req `_setQuery` toQuery ("enum_query_integer", Just xs)

-- | /Optional Param/ "enum_query_double" - Query parameter enum test (double)
instance HasOptionalParam TestEnumParameters EnumQueryDouble where
  applyOptionalParam req (EnumQueryDouble xs) =
    req `_addForm` toForm ("enum_query_double", xs)

-- | @*/*@
instance Consumes TestEnumParameters MimeAny

-- | @*/*@
instance Produces TestEnumParameters MimeAny


-- *** testJsonFormData

-- | @GET \/fake\/jsonFormData@
-- 
-- test json serialization of form data
-- 
-- 
-- 
testJsonFormData 
  :: (Consumes TestJsonFormData contentType)
  => contentType -- ^ request content-type ('MimeType')
  -> Text -- ^ "param" -  field1
  -> Text -- ^ "param2" -  field2
  -> SwaggerPetstoreRequest TestJsonFormData contentType NoContent
testJsonFormData _ param param2 =
  _mkRequest "GET" ["/fake/jsonFormData"]
    `_addForm` toForm ("param", param)
    `_addForm` toForm ("param2", param2)

data TestJsonFormData  

-- | @application/json@
instance Consumes TestJsonFormData MimeJSON


-- ** FakeClassnameTags123

-- *** testClassname

-- | @PATCH \/fake_classname_test@
-- 
-- To test class name in snake case
-- 
-- AuthMethod: api_key_query
-- 
testClassname 
  :: (Consumes TestClassname contentType, MimeRender contentType Client)
  => contentType -- ^ request content-type ('MimeType')
  -> Client -- ^ "body" -  client model
  -> SwaggerPetstoreRequest TestClassname contentType Client
testClassname _ body =
  _mkRequest "PATCH" ["/fake_classname_test"]
    `setBodyParam` body

data TestClassname 

-- | /Body Param/ "body" - client model
instance HasBodyParam TestClassname Client 

-- | @application/json@
instance Consumes TestClassname MimeJSON

-- | @application/json@
instance Produces TestClassname MimeJSON


-- ** Pet

-- *** addPet

-- | @POST \/pet@
-- 
-- Add a new pet to the store
-- 
-- 
-- 
-- AuthMethod: petstore_auth
-- 
-- Note: Has 'Produces' instances, but no response schema
-- 
addPet 
  :: (Consumes AddPet contentType, MimeRender contentType Pet)
  => contentType -- ^ request content-type ('MimeType')
  -> Pet -- ^ "body" -  Pet object that needs to be added to the store
  -> SwaggerPetstoreRequest AddPet contentType res
addPet _ body =
  _mkRequest "POST" ["/pet"]
    `setBodyParam` body

data AddPet 

-- | /Body Param/ "body" - Pet object that needs to be added to the store
instance HasBodyParam AddPet Pet 

-- | @application/json@
instance Consumes AddPet MimeJSON
-- | @application/xml@
instance Consumes AddPet MimeXML

-- | @application/xml@
instance Produces AddPet MimeXML
-- | @application/json@
instance Produces AddPet MimeJSON


-- *** deletePet

-- | @DELETE \/pet\/{petId}@
-- 
-- Deletes a pet
-- 
-- 
-- 
-- AuthMethod: petstore_auth
-- 
-- Note: Has 'Produces' instances, but no response schema
-- 
deletePet 
  :: Integer -- ^ "petId" -  Pet id to delete
  -> SwaggerPetstoreRequest DeletePet MimeNoContent res
deletePet petId =
  _mkRequest "DELETE" ["/pet/",toPath petId]
    

data DeletePet  
instance HasOptionalParam DeletePet ApiKey where
  applyOptionalParam req (ApiKey xs) =
    req `setHeader` toHeader ("api_key", xs)
-- | @application/xml@
instance Produces DeletePet MimeXML
-- | @application/json@
instance Produces DeletePet MimeJSON


-- *** findPetsByStatus

-- | @GET \/pet\/findByStatus@
-- 
-- Finds Pets by status
-- 
-- Multiple status values can be provided with comma separated strings
-- 
-- AuthMethod: petstore_auth
-- 
findPetsByStatus 
  :: [Text] -- ^ "status" -  Status values that need to be considered for filter
  -> SwaggerPetstoreRequest FindPetsByStatus MimeNoContent [Pet]
findPetsByStatus status =
  _mkRequest "GET" ["/pet/findByStatus"]
    `_setQuery` toQueryColl CommaSeparated ("status", Just status)

data FindPetsByStatus  
-- | @application/xml@
instance Produces FindPetsByStatus MimeXML
-- | @application/json@
instance Produces FindPetsByStatus MimeJSON


-- *** findPetsByTags

-- | @GET \/pet\/findByTags@
-- 
-- Finds Pets by tags
-- 
-- Multiple tags can be provided with comma separated strings. Use tag1, tag2, tag3 for testing.
-- 
-- AuthMethod: petstore_auth
-- 
findPetsByTags 
  :: [Text] -- ^ "tags" -  Tags to filter by
  -> SwaggerPetstoreRequest FindPetsByTags MimeNoContent [Pet]
findPetsByTags tags =
  _mkRequest "GET" ["/pet/findByTags"]
    `_setQuery` toQueryColl CommaSeparated ("tags", Just tags)

{-# DEPRECATED findPetsByTags "" #-}

data FindPetsByTags  
-- | @application/xml@
instance Produces FindPetsByTags MimeXML
-- | @application/json@
instance Produces FindPetsByTags MimeJSON


-- *** getPetById

-- | @GET \/pet\/{petId}@
-- 
-- Find pet by ID
-- 
-- Returns a single pet
-- 
-- AuthMethod: api_key
-- 
getPetById 
  :: Integer -- ^ "petId" -  ID of pet to return
  -> SwaggerPetstoreRequest GetPetById MimeNoContent Pet
getPetById petId =
  _mkRequest "GET" ["/pet/",toPath petId]
    

data GetPetById  
-- | @application/xml@
instance Produces GetPetById MimeXML
-- | @application/json@
instance Produces GetPetById MimeJSON


-- *** updatePet

-- | @PUT \/pet@
-- 
-- Update an existing pet
-- 
-- 
-- 
-- AuthMethod: petstore_auth
-- 
-- Note: Has 'Produces' instances, but no response schema
-- 
updatePet 
  :: (Consumes UpdatePet contentType, MimeRender contentType Pet)
  => contentType -- ^ request content-type ('MimeType')
  -> Pet -- ^ "body" -  Pet object that needs to be added to the store
  -> SwaggerPetstoreRequest UpdatePet contentType res
updatePet _ body =
  _mkRequest "PUT" ["/pet"]
    `setBodyParam` body

data UpdatePet 

-- | /Body Param/ "body" - Pet object that needs to be added to the store
instance HasBodyParam UpdatePet Pet 

-- | @application/json@
instance Consumes UpdatePet MimeJSON
-- | @application/xml@
instance Consumes UpdatePet MimeXML

-- | @application/xml@
instance Produces UpdatePet MimeXML
-- | @application/json@
instance Produces UpdatePet MimeJSON


-- *** updatePetWithForm

-- | @POST \/pet\/{petId}@
-- 
-- Updates a pet in the store with form data
-- 
-- 
-- 
-- AuthMethod: petstore_auth
-- 
-- Note: Has 'Produces' instances, but no response schema
-- 
updatePetWithForm 
  :: (Consumes UpdatePetWithForm contentType)
  => contentType -- ^ request content-type ('MimeType')
  -> Integer -- ^ "petId" -  ID of pet that needs to be updated
  -> SwaggerPetstoreRequest UpdatePetWithForm contentType res
updatePetWithForm _ petId =
  _mkRequest "POST" ["/pet/",toPath petId]
    

data UpdatePetWithForm  

-- | /Optional Param/ "name" - Updated name of the pet
instance HasOptionalParam UpdatePetWithForm Name2 where
  applyOptionalParam req (Name2 xs) =
    req `_addForm` toForm ("name", xs)

-- | /Optional Param/ "status" - Updated status of the pet
instance HasOptionalParam UpdatePetWithForm Status where
  applyOptionalParam req (Status xs) =
    req `_addForm` toForm ("status", xs)

-- | @application/x-www-form-urlencoded@
instance Consumes UpdatePetWithForm MimeFormUrlEncoded

-- | @application/xml@
instance Produces UpdatePetWithForm MimeXML
-- | @application/json@
instance Produces UpdatePetWithForm MimeJSON


-- *** uploadFile

-- | @POST \/pet\/{petId}\/uploadImage@
-- 
-- uploads an image
-- 
-- 
-- 
-- AuthMethod: petstore_auth
-- 
uploadFile 
  :: (Consumes UploadFile contentType)
  => contentType -- ^ request content-type ('MimeType')
  -> Integer -- ^ "petId" -  ID of pet to update
  -> SwaggerPetstoreRequest UploadFile contentType ApiResponse
uploadFile _ petId =
  _mkRequest "POST" ["/pet/",toPath petId,"/uploadImage"]
    

data UploadFile  

-- | /Optional Param/ "additionalMetadata" - Additional data to pass to server
instance HasOptionalParam UploadFile AdditionalMetadata where
  applyOptionalParam req (AdditionalMetadata xs) =
    req `_addMultiFormPart` NH.partLBS "additionalMetadata" (mimeRender' MimeMultipartFormData xs)

-- | /Optional Param/ "file" - file to upload
instance HasOptionalParam UploadFile File where
  applyOptionalParam req (File xs) =
    req `_addMultiFormPart` NH.partFileSource "file" xs

-- | @multipart/form-data@
instance Consumes UploadFile MimeMultipartFormData

-- | @application/json@
instance Produces UploadFile MimeJSON


-- ** Store

-- *** deleteOrder

-- | @DELETE \/store\/order\/{order_id}@
-- 
-- Delete purchase order by ID
-- 
-- For valid response try integer IDs with value < 1000. Anything above 1000 or nonintegers will generate API errors
-- 
-- Note: Has 'Produces' instances, but no response schema
-- 
deleteOrder 
  :: Text -- ^ "orderId" -  ID of the order that needs to be deleted
  -> SwaggerPetstoreRequest DeleteOrder MimeNoContent res
deleteOrder orderId =
  _mkRequest "DELETE" ["/store/order/",toPath orderId]
    

data DeleteOrder  
-- | @application/xml@
instance Produces DeleteOrder MimeXML
-- | @application/json@
instance Produces DeleteOrder MimeJSON


-- *** getInventory

-- | @GET \/store\/inventory@
-- 
-- Returns pet inventories by status
-- 
-- Returns a map of status codes to quantities
-- 
-- AuthMethod: api_key
-- 
getInventory 
  :: SwaggerPetstoreRequest GetInventory MimeNoContent ((Map.Map String Int))
getInventory =
  _mkRequest "GET" ["/store/inventory"]

data GetInventory  
-- | @application/json@
instance Produces GetInventory MimeJSON


-- *** getOrderById

-- | @GET \/store\/order\/{order_id}@
-- 
-- Find purchase order by ID
-- 
-- For valid response try integer IDs with value <= 5 or > 10. Other values will generated exceptions
-- 
getOrderById 
  :: Integer -- ^ "orderId" -  ID of pet that needs to be fetched
  -> SwaggerPetstoreRequest GetOrderById MimeNoContent Order
getOrderById orderId =
  _mkRequest "GET" ["/store/order/",toPath orderId]
    

data GetOrderById  
-- | @application/xml@
instance Produces GetOrderById MimeXML
-- | @application/json@
instance Produces GetOrderById MimeJSON


-- *** placeOrder

-- | @POST \/store\/order@
-- 
-- Place an order for a pet
-- 
-- 
-- 
placeOrder 
  :: (Consumes PlaceOrder contentType, MimeRender contentType Order)
  => contentType -- ^ request content-type ('MimeType')
  -> Order -- ^ "body" -  order placed for purchasing the pet
  -> SwaggerPetstoreRequest PlaceOrder contentType Order
placeOrder _ body =
  _mkRequest "POST" ["/store/order"]
    `setBodyParam` body

data PlaceOrder 

-- | /Body Param/ "body" - order placed for purchasing the pet
instance HasBodyParam PlaceOrder Order 
-- | @application/xml@
instance Produces PlaceOrder MimeXML
-- | @application/json@
instance Produces PlaceOrder MimeJSON


-- ** User

-- *** createUser

-- | @POST \/user@
-- 
-- Create user
-- 
-- This can only be done by the logged in user.
-- 
-- Note: Has 'Produces' instances, but no response schema
-- 
createUser 
  :: (Consumes CreateUser contentType, MimeRender contentType User)
  => contentType -- ^ request content-type ('MimeType')
  -> User -- ^ "body" -  Created user object
  -> SwaggerPetstoreRequest CreateUser contentType res
createUser _ body =
  _mkRequest "POST" ["/user"]
    `setBodyParam` body

data CreateUser 

-- | /Body Param/ "body" - Created user object
instance HasBodyParam CreateUser User 
-- | @application/xml@
instance Produces CreateUser MimeXML
-- | @application/json@
instance Produces CreateUser MimeJSON


-- *** createUsersWithArrayInput

-- | @POST \/user\/createWithArray@
-- 
-- Creates list of users with given input array
-- 
-- 
-- 
-- Note: Has 'Produces' instances, but no response schema
-- 
createUsersWithArrayInput 
  :: (Consumes CreateUsersWithArrayInput contentType, MimeRender contentType [User])
  => contentType -- ^ request content-type ('MimeType')
  -> [User] -- ^ "body" -  List of user object
  -> SwaggerPetstoreRequest CreateUsersWithArrayInput contentType res
createUsersWithArrayInput _ body =
  _mkRequest "POST" ["/user/createWithArray"]
    `setBodyParam` body

data CreateUsersWithArrayInput 

-- | /Body Param/ "body" - List of user object
instance HasBodyParam CreateUsersWithArrayInput [User] 
-- | @application/xml@
instance Produces CreateUsersWithArrayInput MimeXML
-- | @application/json@
instance Produces CreateUsersWithArrayInput MimeJSON


-- *** createUsersWithListInput

-- | @POST \/user\/createWithList@
-- 
-- Creates list of users with given input array
-- 
-- 
-- 
-- Note: Has 'Produces' instances, but no response schema
-- 
createUsersWithListInput 
  :: (Consumes CreateUsersWithListInput contentType, MimeRender contentType [User])
  => contentType -- ^ request content-type ('MimeType')
  -> [User] -- ^ "body" -  List of user object
  -> SwaggerPetstoreRequest CreateUsersWithListInput contentType res
createUsersWithListInput _ body =
  _mkRequest "POST" ["/user/createWithList"]
    `setBodyParam` body

data CreateUsersWithListInput 

-- | /Body Param/ "body" - List of user object
instance HasBodyParam CreateUsersWithListInput [User] 
-- | @application/xml@
instance Produces CreateUsersWithListInput MimeXML
-- | @application/json@
instance Produces CreateUsersWithListInput MimeJSON


-- *** deleteUser

-- | @DELETE \/user\/{username}@
-- 
-- Delete user
-- 
-- This can only be done by the logged in user.
-- 
-- Note: Has 'Produces' instances, but no response schema
-- 
deleteUser 
  :: Text -- ^ "username" -  The name that needs to be deleted
  -> SwaggerPetstoreRequest DeleteUser MimeNoContent res
deleteUser username =
  _mkRequest "DELETE" ["/user/",toPath username]
    

data DeleteUser  
-- | @application/xml@
instance Produces DeleteUser MimeXML
-- | @application/json@
instance Produces DeleteUser MimeJSON


-- *** getUserByName

-- | @GET \/user\/{username}@
-- 
-- Get user by user name
-- 
-- 
-- 
getUserByName 
  :: Text -- ^ "username" -  The name that needs to be fetched. Use user1 for testing. 
  -> SwaggerPetstoreRequest GetUserByName MimeNoContent User
getUserByName username =
  _mkRequest "GET" ["/user/",toPath username]
    

data GetUserByName  
-- | @application/xml@
instance Produces GetUserByName MimeXML
-- | @application/json@
instance Produces GetUserByName MimeJSON


-- *** loginUser

-- | @GET \/user\/login@
-- 
-- Logs user into the system
-- 
-- 
-- 
loginUser 
  :: Text -- ^ "username" -  The user name for login
  -> Text -- ^ "password" -  The password for login in clear text
  -> SwaggerPetstoreRequest LoginUser MimeNoContent Text
loginUser username password =
  _mkRequest "GET" ["/user/login"]
    `_setQuery` toQuery ("username", Just username)
    `_setQuery` toQuery ("password", Just password)

data LoginUser  
-- | @application/xml@
instance Produces LoginUser MimeXML
-- | @application/json@
instance Produces LoginUser MimeJSON


-- *** logoutUser

-- | @GET \/user\/logout@
-- 
-- Logs out current logged in user session
-- 
-- 
-- 
-- Note: Has 'Produces' instances, but no response schema
-- 
logoutUser 
  :: SwaggerPetstoreRequest LogoutUser MimeNoContent res
logoutUser =
  _mkRequest "GET" ["/user/logout"]

data LogoutUser  
-- | @application/xml@
instance Produces LogoutUser MimeXML
-- | @application/json@
instance Produces LogoutUser MimeJSON


-- *** updateUser

-- | @PUT \/user\/{username}@
-- 
-- Updated user
-- 
-- This can only be done by the logged in user.
-- 
-- Note: Has 'Produces' instances, but no response schema
-- 
updateUser 
  :: (Consumes UpdateUser contentType, MimeRender contentType User)
  => contentType -- ^ request content-type ('MimeType')
  -> Text -- ^ "username" -  name that need to be deleted
  -> User -- ^ "body" -  Updated user object
  -> SwaggerPetstoreRequest UpdateUser contentType res
updateUser _ username body =
  _mkRequest "PUT" ["/user/",toPath username]
    
    `setBodyParam` body

data UpdateUser 

-- | /Body Param/ "body" - Updated user object
instance HasBodyParam UpdateUser User 
-- | @application/xml@
instance Produces UpdateUser MimeXML
-- | @application/json@
instance Produces UpdateUser MimeJSON



-- * HasBodyParam

-- | Designates the body parameter of a request
class HasBodyParam req param where
  setBodyParam :: forall contentType res. (Consumes req contentType, MimeRender contentType param) => SwaggerPetstoreRequest req contentType res -> param -> SwaggerPetstoreRequest req contentType res
  setBodyParam req xs =
    req `_setBodyLBS` mimeRender (P.Proxy :: P.Proxy contentType) xs & _setContentTypeHeader

-- * HasOptionalParam

-- | Designates the optional parameters of a request
class HasOptionalParam req param where
  {-# MINIMAL applyOptionalParam | (-&-) #-}

  -- | Apply an optional parameter to a request
  applyOptionalParam :: SwaggerPetstoreRequest req contentType res -> param -> SwaggerPetstoreRequest req contentType res
  applyOptionalParam = (-&-)
  {-# INLINE applyOptionalParam #-}

  -- | infix operator \/ alias for 'addOptionalParam'
  (-&-) :: SwaggerPetstoreRequest req contentType res -> param -> SwaggerPetstoreRequest req contentType res
  (-&-) = applyOptionalParam
  {-# INLINE (-&-) #-}

infixl 2 -&-
 
-- * Optional Request Parameter Types


newtype BodyOuterBoolean = BodyOuterBoolean { unBodyOuterBoolean :: OuterBoolean } deriving (P.Eq, P.Show)

newtype BodyOuterComposite = BodyOuterComposite { unBodyOuterComposite :: OuterComposite } deriving (P.Eq, P.Show)

newtype Body = Body { unBody :: OuterNumber } deriving (P.Eq, P.Show)

newtype BodyOuterString = BodyOuterString { unBodyOuterString :: OuterString } deriving (P.Eq, P.Show)

newtype ParamInteger = ParamInteger { unParamInteger :: Int } deriving (P.Eq, P.Show)

newtype Int32 = Int32 { unInt32 :: Int } deriving (P.Eq, P.Show)

newtype Int64 = Int64 { unInt64 :: Integer } deriving (P.Eq, P.Show)

newtype ParamFloat = ParamFloat { unParamFloat :: Float } deriving (P.Eq, P.Show)

newtype ParamString = ParamString { unParamString :: Text } deriving (P.Eq, P.Show)

newtype ParamBinary = ParamBinary { unParamBinary :: Binary } deriving (P.Eq, P.Show)

newtype ParamDate = ParamDate { unParamDate :: Date } deriving (P.Eq, P.Show)

newtype ParamDateTime = ParamDateTime { unParamDateTime :: DateTime } deriving (P.Eq, P.Show)

newtype Password = Password { unPassword :: Text } deriving (P.Eq, P.Show)

newtype Callback = Callback { unCallback :: Text } deriving (P.Eq, P.Show)

newtype EnumFormStringArray = EnumFormStringArray { unEnumFormStringArray :: [Text] } deriving (P.Eq, P.Show)

newtype EnumFormString = EnumFormString { unEnumFormString :: Text } deriving (P.Eq, P.Show)

newtype EnumHeaderStringArray = EnumHeaderStringArray { unEnumHeaderStringArray :: [Text] } deriving (P.Eq, P.Show)

newtype EnumHeaderString = EnumHeaderString { unEnumHeaderString :: Text } deriving (P.Eq, P.Show)

newtype EnumQueryStringArray = EnumQueryStringArray { unEnumQueryStringArray :: [Text] } deriving (P.Eq, P.Show)

newtype EnumQueryString = EnumQueryString { unEnumQueryString :: Text } deriving (P.Eq, P.Show)

newtype EnumQueryInteger = EnumQueryInteger { unEnumQueryInteger :: Int } deriving (P.Eq, P.Show)

newtype EnumQueryDouble = EnumQueryDouble { unEnumQueryDouble :: Double } deriving (P.Eq, P.Show)

newtype ApiKey = ApiKey { unApiKey :: Text } deriving (P.Eq, P.Show)

newtype Name2 = Name2 { unName2 :: Text } deriving (P.Eq, P.Show)

newtype Status = Status { unStatus :: Text } deriving (P.Eq, P.Show)

newtype AdditionalMetadata = AdditionalMetadata { unAdditionalMetadata :: Text } deriving (P.Eq, P.Show)

newtype File = File { unFile :: FilePath } deriving (P.Eq, P.Show)


-- * SwaggerPetstoreRequest

-- | Represents a request. The "req" type variable is the request type. The "res" type variable is the response type.
data SwaggerPetstoreRequest req contentType res = SwaggerPetstoreRequest
  { rMethod  :: NH.Method   -- ^ Method of SwaggerPetstoreRequest
  , rUrlPath :: [BCL.ByteString] -- ^ Endpoint of SwaggerPetstoreRequest
  , rParams   :: Params -- ^ params of SwaggerPetstoreRequest
  }
  deriving (P.Show)

-- | 'rMethod' Lens
rMethodL :: Lens_' (SwaggerPetstoreRequest req contentType res) NH.Method
rMethodL f SwaggerPetstoreRequest{..} = (\rMethod -> SwaggerPetstoreRequest { rMethod, ..} ) <$> f rMethod
{-# INLINE rMethodL #-}

-- | 'rUrlPath' Lens
rUrlPathL :: Lens_' (SwaggerPetstoreRequest req contentType res) [BCL.ByteString]
rUrlPathL f SwaggerPetstoreRequest{..} = (\rUrlPath -> SwaggerPetstoreRequest { rUrlPath, ..} ) <$> f rUrlPath
{-# INLINE rUrlPathL #-}

-- | 'rParams' Lens
rParamsL :: Lens_' (SwaggerPetstoreRequest req contentType res) Params
rParamsL f SwaggerPetstoreRequest{..} = (\rParams -> SwaggerPetstoreRequest { rParams, ..} ) <$> f rParams
{-# INLINE rParamsL #-}

-- | Request Params
data Params = Params
  { paramsQuery :: NH.Query
  , paramsHeaders :: NH.RequestHeaders
  , paramsBody :: ParamBody
  }
  deriving (P.Show)

-- | 'paramsQuery' Lens
paramsQueryL :: Lens_' Params NH.Query
paramsQueryL f Params{..} = (\paramsQuery -> Params { paramsQuery, ..} ) <$> f paramsQuery
{-# INLINE paramsQueryL #-}

-- | 'paramsHeaders' Lens
paramsHeadersL :: Lens_' Params NH.RequestHeaders
paramsHeadersL f Params{..} = (\paramsHeaders -> Params { paramsHeaders, ..} ) <$> f paramsHeaders
{-# INLINE paramsHeadersL #-}

-- | 'paramsBody' Lens
paramsBodyL :: Lens_' Params ParamBody
paramsBodyL f Params{..} = (\paramsBody -> Params { paramsBody, ..} ) <$> f paramsBody
{-# INLINE paramsBodyL #-}

-- | Request Body
data ParamBody
  = ParamBodyNone
  | ParamBodyB B.ByteString
  | ParamBodyBL BL.ByteString
  | ParamBodyFormUrlEncoded WH.Form
  | ParamBodyMultipartFormData [NH.Part]
  deriving (P.Show)

-- ** SwaggerPetstoreRequest Utils

_mkRequest :: NH.Method -- ^ Method 
          -> [BCL.ByteString] -- ^ Endpoint
          -> SwaggerPetstoreRequest req contentType res -- ^ req: Request Type, res: Response Type
_mkRequest m u = SwaggerPetstoreRequest m u _mkParams

_mkParams :: Params
_mkParams = Params [] [] ParamBodyNone

setHeader :: SwaggerPetstoreRequest req contentType res -> [NH.Header] -> SwaggerPetstoreRequest req contentType res
setHeader req header =
  req `removeHeader` P.fmap P.fst header &
  L.over (rParamsL . paramsHeadersL) (header P.++)

removeHeader :: SwaggerPetstoreRequest req contentType res -> [NH.HeaderName] -> SwaggerPetstoreRequest req contentType res
removeHeader req header =
  req &
  L.over
    (rParamsL . paramsHeadersL)
    (P.filter (\h -> cifst h `P.notElem` P.fmap CI.mk header))
  where
    cifst = CI.mk . P.fst


_setContentTypeHeader :: forall req contentType res. MimeType contentType => SwaggerPetstoreRequest req contentType res -> SwaggerPetstoreRequest req contentType res
_setContentTypeHeader req =
    case mimeType (P.Proxy :: P.Proxy contentType) of 
        Just m -> req `setHeader` [("content-type", BC.pack $ P.show m)]
        Nothing -> req `removeHeader` ["content-type"]

_setAcceptHeader :: forall req contentType res accept. MimeType accept => SwaggerPetstoreRequest req contentType res -> accept -> SwaggerPetstoreRequest req contentType res
_setAcceptHeader req accept =
    case mimeType' accept of 
        Just m -> req `setHeader` [("accept", BC.pack $ P.show m)]
        Nothing -> req `removeHeader` ["accept"]

_setQuery :: SwaggerPetstoreRequest req contentType res -> [NH.QueryItem] -> SwaggerPetstoreRequest req contentType res
_setQuery req query = 
  req &
  L.over
    (rParamsL . paramsQueryL)
    ((query P.++) . P.filter (\q -> cifst q `P.notElem` P.fmap cifst query))
  where
    cifst = CI.mk . P.fst

_addForm :: SwaggerPetstoreRequest req contentType res -> WH.Form -> SwaggerPetstoreRequest req contentType res
_addForm req newform = 
    let form = case paramsBody (rParams req) of
            ParamBodyFormUrlEncoded _form -> _form
            _ -> mempty
    in req & L.set (rParamsL . paramsBodyL) (ParamBodyFormUrlEncoded (newform <> form))

_addMultiFormPart :: SwaggerPetstoreRequest req contentType res -> NH.Part -> SwaggerPetstoreRequest req contentType res
_addMultiFormPart req newpart = 
    let parts = case paramsBody (rParams req) of
            ParamBodyMultipartFormData _parts -> _parts
            _ -> []
    in req & L.set (rParamsL . paramsBodyL) (ParamBodyMultipartFormData (newpart : parts))

_setBodyBS :: SwaggerPetstoreRequest req contentType res -> B.ByteString -> SwaggerPetstoreRequest req contentType res
_setBodyBS req body = 
    req & L.set (rParamsL . paramsBodyL) (ParamBodyB body)

_setBodyLBS :: SwaggerPetstoreRequest req contentType res -> BL.ByteString -> SwaggerPetstoreRequest req contentType res
_setBodyLBS req body = 
    req & L.set (rParamsL . paramsBodyL) (ParamBodyBL body)


-- ** Params Utils

toPath
  :: WH.ToHttpApiData a
  => a -> BCL.ByteString
toPath = BB.toLazyByteString . WH.toEncodedUrlPiece

toHeader :: WH.ToHttpApiData a => (NH.HeaderName, a) -> [NH.Header]
toHeader x = [fmap WH.toHeader x]

toForm :: WH.ToHttpApiData v => (BC.ByteString, v) -> WH.Form
toForm (k,v) = WH.toForm [(BC.unpack k,v)]

toQuery :: WH.ToHttpApiData a => (BC.ByteString, Maybe a) -> [NH.QueryItem]
toQuery x = [(fmap . fmap) toQueryParam x]
  where toQueryParam = T.encodeUtf8 . WH.toQueryParam

-- *** Swagger `CollectionFormat` Utils

-- | Determines the format of the array if type array is used.
data CollectionFormat
  = CommaSeparated -- ^ CSV format for multiple parameters.
  | SpaceSeparated -- ^ Also called "SSV"
  | TabSeparated -- ^ Also called "TSV"
  | PipeSeparated -- ^ `value1|value2|value2`
  | MultiParamArray -- ^ Using multiple GET parameters, e.g. `foo=bar&foo=baz`. This is valid only for parameters in "query" ('NH.Query') or "formData" ('WH.Form')

toHeaderColl :: WH.ToHttpApiData a => CollectionFormat -> (NH.HeaderName, [a]) -> [NH.Header]
toHeaderColl c xs = _toColl c toHeader xs

toFormColl :: WH.ToHttpApiData v => CollectionFormat -> (BC.ByteString, [v]) -> WH.Form
toFormColl c xs = WH.toForm $ fmap unpack $ _toColl c toHeader $ pack xs
  where
    pack (k,v) = (CI.mk k, v)
    unpack (k,v) = (BC.unpack (CI.original k), BC.unpack v)

toQueryColl :: WH.ToHttpApiData a => CollectionFormat -> (BC.ByteString, Maybe [a]) -> NH.Query
toQueryColl c xs = _toCollA c toQuery xs

_toColl :: P.Traversable f => CollectionFormat -> (f a -> [(b, BC.ByteString)]) -> f [a] -> [(b, BC.ByteString)]
_toColl c encode xs = fmap (fmap P.fromJust) (_toCollA' c fencode BC.singleton (fmap Just xs))
  where fencode = fmap (fmap Just) . encode . fmap P.fromJust
        {-# INLINE fencode #-}

_toCollA :: (P.Traversable f, P.Traversable t, P.Alternative t) => CollectionFormat -> (f (t a) -> [(b, t BC.ByteString)]) -> f (t [a]) -> [(b, t BC.ByteString)]
_toCollA c encode xs = _toCollA' c encode BC.singleton xs

_toCollA' :: (P.Monoid c, P.Traversable f, P.Traversable t, P.Alternative t) => CollectionFormat -> (f (t a) -> [(b, t c)]) -> (Char -> c) -> f (t [a]) -> [(b, t c)]
_toCollA' c encode one xs = case c of
  CommaSeparated -> go (one ',')
  SpaceSeparated -> go (one ' ')
  TabSeparated -> go (one '\t')
  PipeSeparated -> go (one '|')
  MultiParamArray -> expandList
  where
    go sep =
      [P.foldl1 (\(sk, sv) (_, v) -> (sk, (combine sep <$> sv <*> v) <|> sv <|> v)) expandList]
    combine sep x y = x <> sep <> y
    expandList = (P.concatMap encode . (P.traverse . P.traverse) P.toList) xs
    {-# INLINE go #-}
    {-# INLINE expandList #-}
    {-# INLINE combine #-}
  
