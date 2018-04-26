
module AWS.SimpleDB.Types where

import Prelude
import Data.Foreign.Class (class Decode, class Encode)
import Data.Foreign.Generic (defaultOptions, genericDecode, genericEncode)
import Data.Foreign.Generic.Types (Options)
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Maybe (Maybe(..))
import Data.Newtype (class Newtype)
import Data.StrMap (StrMap) as StrMap

import AWS.Request.Types as Types

options :: Options
options = defaultOptions { unwrapSingleConstructors = true }


-- | <p></p>
newtype Attribute = Attribute 
  { "Name" :: (String)
  , "AlternateNameEncoding" :: Maybe (String)
  , "Value" :: (String)
  , "AlternateValueEncoding" :: Maybe (String)
  }
derive instance newtypeAttribute :: Newtype Attribute _
derive instance repGenericAttribute :: Generic Attribute _
instance showAttribute :: Show Attribute where show = genericShow
instance decodeAttribute :: Decode Attribute where decode = genericDecode options
instance encodeAttribute :: Encode Attribute where encode = genericEncode options

-- | Constructs Attribute from required parameters
newAttribute :: String -> String -> Attribute
newAttribute _Name _Value = Attribute { "Name": _Name, "Value": _Value, "AlternateNameEncoding": Nothing, "AlternateValueEncoding": Nothing }

-- | Constructs Attribute's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newAttribute' :: String -> String -> ( { "Name" :: (String) , "AlternateNameEncoding" :: Maybe (String) , "Value" :: (String) , "AlternateValueEncoding" :: Maybe (String) } -> {"Name" :: (String) , "AlternateNameEncoding" :: Maybe (String) , "Value" :: (String) , "AlternateValueEncoding" :: Maybe (String) } ) -> Attribute
newAttribute' _Name _Value customize = (Attribute <<< customize) { "Name": _Name, "Value": _Value, "AlternateNameEncoding": Nothing, "AlternateValueEncoding": Nothing }



-- | <p>The specified attribute does not exist.</p>
newtype AttributeDoesNotExist = AttributeDoesNotExist 
  { "BoxUsage" :: Maybe (Number)
  }
derive instance newtypeAttributeDoesNotExist :: Newtype AttributeDoesNotExist _
derive instance repGenericAttributeDoesNotExist :: Generic AttributeDoesNotExist _
instance showAttributeDoesNotExist :: Show AttributeDoesNotExist where show = genericShow
instance decodeAttributeDoesNotExist :: Decode AttributeDoesNotExist where decode = genericDecode options
instance encodeAttributeDoesNotExist :: Encode AttributeDoesNotExist where encode = genericEncode options

-- | Constructs AttributeDoesNotExist from required parameters
newAttributeDoesNotExist :: AttributeDoesNotExist
newAttributeDoesNotExist  = AttributeDoesNotExist { "BoxUsage": Nothing }

-- | Constructs AttributeDoesNotExist's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newAttributeDoesNotExist' :: ( { "BoxUsage" :: Maybe (Number) } -> {"BoxUsage" :: Maybe (Number) } ) -> AttributeDoesNotExist
newAttributeDoesNotExist'  customize = (AttributeDoesNotExist <<< customize) { "BoxUsage": Nothing }



newtype AttributeList = AttributeList (Array Attribute)
derive instance newtypeAttributeList :: Newtype AttributeList _
derive instance repGenericAttributeList :: Generic AttributeList _
instance showAttributeList :: Show AttributeList where show = genericShow
instance decodeAttributeList :: Decode AttributeList where decode = genericDecode options
instance encodeAttributeList :: Encode AttributeList where encode = genericEncode options



newtype AttributeNameList = AttributeNameList (Array String)
derive instance newtypeAttributeNameList :: Newtype AttributeNameList _
derive instance repGenericAttributeNameList :: Generic AttributeNameList _
instance showAttributeNameList :: Show AttributeNameList where show = genericShow
instance decodeAttributeNameList :: Decode AttributeNameList where decode = genericDecode options
instance encodeAttributeNameList :: Encode AttributeNameList where encode = genericEncode options



newtype BatchDeleteAttributesRequest = BatchDeleteAttributesRequest 
  { "DomainName" :: (String)
  , "Items" :: (DeletableItemList)
  }
derive instance newtypeBatchDeleteAttributesRequest :: Newtype BatchDeleteAttributesRequest _
derive instance repGenericBatchDeleteAttributesRequest :: Generic BatchDeleteAttributesRequest _
instance showBatchDeleteAttributesRequest :: Show BatchDeleteAttributesRequest where show = genericShow
instance decodeBatchDeleteAttributesRequest :: Decode BatchDeleteAttributesRequest where decode = genericDecode options
instance encodeBatchDeleteAttributesRequest :: Encode BatchDeleteAttributesRequest where encode = genericEncode options

-- | Constructs BatchDeleteAttributesRequest from required parameters
newBatchDeleteAttributesRequest :: String -> DeletableItemList -> BatchDeleteAttributesRequest
newBatchDeleteAttributesRequest _DomainName _Items = BatchDeleteAttributesRequest { "DomainName": _DomainName, "Items": _Items }

-- | Constructs BatchDeleteAttributesRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newBatchDeleteAttributesRequest' :: String -> DeletableItemList -> ( { "DomainName" :: (String) , "Items" :: (DeletableItemList) } -> {"DomainName" :: (String) , "Items" :: (DeletableItemList) } ) -> BatchDeleteAttributesRequest
newBatchDeleteAttributesRequest' _DomainName _Items customize = (BatchDeleteAttributesRequest <<< customize) { "DomainName": _DomainName, "Items": _Items }



newtype BatchPutAttributesRequest = BatchPutAttributesRequest 
  { "DomainName" :: (String)
  , "Items" :: (ReplaceableItemList)
  }
derive instance newtypeBatchPutAttributesRequest :: Newtype BatchPutAttributesRequest _
derive instance repGenericBatchPutAttributesRequest :: Generic BatchPutAttributesRequest _
instance showBatchPutAttributesRequest :: Show BatchPutAttributesRequest where show = genericShow
instance decodeBatchPutAttributesRequest :: Decode BatchPutAttributesRequest where decode = genericDecode options
instance encodeBatchPutAttributesRequest :: Encode BatchPutAttributesRequest where encode = genericEncode options

-- | Constructs BatchPutAttributesRequest from required parameters
newBatchPutAttributesRequest :: String -> ReplaceableItemList -> BatchPutAttributesRequest
newBatchPutAttributesRequest _DomainName _Items = BatchPutAttributesRequest { "DomainName": _DomainName, "Items": _Items }

-- | Constructs BatchPutAttributesRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newBatchPutAttributesRequest' :: String -> ReplaceableItemList -> ( { "DomainName" :: (String) , "Items" :: (ReplaceableItemList) } -> {"DomainName" :: (String) , "Items" :: (ReplaceableItemList) } ) -> BatchPutAttributesRequest
newBatchPutAttributesRequest' _DomainName _Items customize = (BatchPutAttributesRequest <<< customize) { "DomainName": _DomainName, "Items": _Items }



newtype CreateDomainRequest = CreateDomainRequest 
  { "DomainName" :: (String)
  }
derive instance newtypeCreateDomainRequest :: Newtype CreateDomainRequest _
derive instance repGenericCreateDomainRequest :: Generic CreateDomainRequest _
instance showCreateDomainRequest :: Show CreateDomainRequest where show = genericShow
instance decodeCreateDomainRequest :: Decode CreateDomainRequest where decode = genericDecode options
instance encodeCreateDomainRequest :: Encode CreateDomainRequest where encode = genericEncode options

-- | Constructs CreateDomainRequest from required parameters
newCreateDomainRequest :: String -> CreateDomainRequest
newCreateDomainRequest _DomainName = CreateDomainRequest { "DomainName": _DomainName }

-- | Constructs CreateDomainRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newCreateDomainRequest' :: String -> ( { "DomainName" :: (String) } -> {"DomainName" :: (String) } ) -> CreateDomainRequest
newCreateDomainRequest' _DomainName customize = (CreateDomainRequest <<< customize) { "DomainName": _DomainName }



-- | <p></p>
newtype DeletableAttribute = DeletableAttribute 
  { "Name" :: (String)
  , "Value" :: Maybe (String)
  }
derive instance newtypeDeletableAttribute :: Newtype DeletableAttribute _
derive instance repGenericDeletableAttribute :: Generic DeletableAttribute _
instance showDeletableAttribute :: Show DeletableAttribute where show = genericShow
instance decodeDeletableAttribute :: Decode DeletableAttribute where decode = genericDecode options
instance encodeDeletableAttribute :: Encode DeletableAttribute where encode = genericEncode options

-- | Constructs DeletableAttribute from required parameters
newDeletableAttribute :: String -> DeletableAttribute
newDeletableAttribute _Name = DeletableAttribute { "Name": _Name, "Value": Nothing }

-- | Constructs DeletableAttribute's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDeletableAttribute' :: String -> ( { "Name" :: (String) , "Value" :: Maybe (String) } -> {"Name" :: (String) , "Value" :: Maybe (String) } ) -> DeletableAttribute
newDeletableAttribute' _Name customize = (DeletableAttribute <<< customize) { "Name": _Name, "Value": Nothing }



newtype DeletableAttributeList = DeletableAttributeList (Array DeletableAttribute)
derive instance newtypeDeletableAttributeList :: Newtype DeletableAttributeList _
derive instance repGenericDeletableAttributeList :: Generic DeletableAttributeList _
instance showDeletableAttributeList :: Show DeletableAttributeList where show = genericShow
instance decodeDeletableAttributeList :: Decode DeletableAttributeList where decode = genericDecode options
instance encodeDeletableAttributeList :: Encode DeletableAttributeList where encode = genericEncode options



newtype DeletableItem = DeletableItem 
  { "Name" :: (String)
  , "Attributes" :: Maybe (DeletableAttributeList)
  }
derive instance newtypeDeletableItem :: Newtype DeletableItem _
derive instance repGenericDeletableItem :: Generic DeletableItem _
instance showDeletableItem :: Show DeletableItem where show = genericShow
instance decodeDeletableItem :: Decode DeletableItem where decode = genericDecode options
instance encodeDeletableItem :: Encode DeletableItem where encode = genericEncode options

-- | Constructs DeletableItem from required parameters
newDeletableItem :: String -> DeletableItem
newDeletableItem _Name = DeletableItem { "Name": _Name, "Attributes": Nothing }

-- | Constructs DeletableItem's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDeletableItem' :: String -> ( { "Name" :: (String) , "Attributes" :: Maybe (DeletableAttributeList) } -> {"Name" :: (String) , "Attributes" :: Maybe (DeletableAttributeList) } ) -> DeletableItem
newDeletableItem' _Name customize = (DeletableItem <<< customize) { "Name": _Name, "Attributes": Nothing }



newtype DeletableItemList = DeletableItemList (Array DeletableItem)
derive instance newtypeDeletableItemList :: Newtype DeletableItemList _
derive instance repGenericDeletableItemList :: Generic DeletableItemList _
instance showDeletableItemList :: Show DeletableItemList where show = genericShow
instance decodeDeletableItemList :: Decode DeletableItemList where decode = genericDecode options
instance encodeDeletableItemList :: Encode DeletableItemList where encode = genericEncode options



newtype DeleteAttributesRequest = DeleteAttributesRequest 
  { "DomainName" :: (String)
  , "ItemName" :: (String)
  , "Attributes" :: Maybe (DeletableAttributeList)
  , "Expected" :: Maybe (UpdateCondition)
  }
derive instance newtypeDeleteAttributesRequest :: Newtype DeleteAttributesRequest _
derive instance repGenericDeleteAttributesRequest :: Generic DeleteAttributesRequest _
instance showDeleteAttributesRequest :: Show DeleteAttributesRequest where show = genericShow
instance decodeDeleteAttributesRequest :: Decode DeleteAttributesRequest where decode = genericDecode options
instance encodeDeleteAttributesRequest :: Encode DeleteAttributesRequest where encode = genericEncode options

-- | Constructs DeleteAttributesRequest from required parameters
newDeleteAttributesRequest :: String -> String -> DeleteAttributesRequest
newDeleteAttributesRequest _DomainName _ItemName = DeleteAttributesRequest { "DomainName": _DomainName, "ItemName": _ItemName, "Attributes": Nothing, "Expected": Nothing }

-- | Constructs DeleteAttributesRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDeleteAttributesRequest' :: String -> String -> ( { "DomainName" :: (String) , "ItemName" :: (String) , "Attributes" :: Maybe (DeletableAttributeList) , "Expected" :: Maybe (UpdateCondition) } -> {"DomainName" :: (String) , "ItemName" :: (String) , "Attributes" :: Maybe (DeletableAttributeList) , "Expected" :: Maybe (UpdateCondition) } ) -> DeleteAttributesRequest
newDeleteAttributesRequest' _DomainName _ItemName customize = (DeleteAttributesRequest <<< customize) { "DomainName": _DomainName, "ItemName": _ItemName, "Attributes": Nothing, "Expected": Nothing }



newtype DeleteDomainRequest = DeleteDomainRequest 
  { "DomainName" :: (String)
  }
derive instance newtypeDeleteDomainRequest :: Newtype DeleteDomainRequest _
derive instance repGenericDeleteDomainRequest :: Generic DeleteDomainRequest _
instance showDeleteDomainRequest :: Show DeleteDomainRequest where show = genericShow
instance decodeDeleteDomainRequest :: Decode DeleteDomainRequest where decode = genericDecode options
instance encodeDeleteDomainRequest :: Encode DeleteDomainRequest where encode = genericEncode options

-- | Constructs DeleteDomainRequest from required parameters
newDeleteDomainRequest :: String -> DeleteDomainRequest
newDeleteDomainRequest _DomainName = DeleteDomainRequest { "DomainName": _DomainName }

-- | Constructs DeleteDomainRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDeleteDomainRequest' :: String -> ( { "DomainName" :: (String) } -> {"DomainName" :: (String) } ) -> DeleteDomainRequest
newDeleteDomainRequest' _DomainName customize = (DeleteDomainRequest <<< customize) { "DomainName": _DomainName }



newtype DomainMetadataRequest = DomainMetadataRequest 
  { "DomainName" :: (String)
  }
derive instance newtypeDomainMetadataRequest :: Newtype DomainMetadataRequest _
derive instance repGenericDomainMetadataRequest :: Generic DomainMetadataRequest _
instance showDomainMetadataRequest :: Show DomainMetadataRequest where show = genericShow
instance decodeDomainMetadataRequest :: Decode DomainMetadataRequest where decode = genericDecode options
instance encodeDomainMetadataRequest :: Encode DomainMetadataRequest where encode = genericEncode options

-- | Constructs DomainMetadataRequest from required parameters
newDomainMetadataRequest :: String -> DomainMetadataRequest
newDomainMetadataRequest _DomainName = DomainMetadataRequest { "DomainName": _DomainName }

-- | Constructs DomainMetadataRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDomainMetadataRequest' :: String -> ( { "DomainName" :: (String) } -> {"DomainName" :: (String) } ) -> DomainMetadataRequest
newDomainMetadataRequest' _DomainName customize = (DomainMetadataRequest <<< customize) { "DomainName": _DomainName }



newtype DomainMetadataResult = DomainMetadataResult 
  { "ItemCount" :: Maybe (Int)
  , "ItemNamesSizeBytes" :: Maybe (Number)
  , "AttributeNameCount" :: Maybe (Int)
  , "AttributeNamesSizeBytes" :: Maybe (Number)
  , "AttributeValueCount" :: Maybe (Int)
  , "AttributeValuesSizeBytes" :: Maybe (Number)
  , "Timestamp" :: Maybe (Int)
  }
derive instance newtypeDomainMetadataResult :: Newtype DomainMetadataResult _
derive instance repGenericDomainMetadataResult :: Generic DomainMetadataResult _
instance showDomainMetadataResult :: Show DomainMetadataResult where show = genericShow
instance decodeDomainMetadataResult :: Decode DomainMetadataResult where decode = genericDecode options
instance encodeDomainMetadataResult :: Encode DomainMetadataResult where encode = genericEncode options

-- | Constructs DomainMetadataResult from required parameters
newDomainMetadataResult :: DomainMetadataResult
newDomainMetadataResult  = DomainMetadataResult { "AttributeNameCount": Nothing, "AttributeNamesSizeBytes": Nothing, "AttributeValueCount": Nothing, "AttributeValuesSizeBytes": Nothing, "ItemCount": Nothing, "ItemNamesSizeBytes": Nothing, "Timestamp": Nothing }

-- | Constructs DomainMetadataResult's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDomainMetadataResult' :: ( { "ItemCount" :: Maybe (Int) , "ItemNamesSizeBytes" :: Maybe (Number) , "AttributeNameCount" :: Maybe (Int) , "AttributeNamesSizeBytes" :: Maybe (Number) , "AttributeValueCount" :: Maybe (Int) , "AttributeValuesSizeBytes" :: Maybe (Number) , "Timestamp" :: Maybe (Int) } -> {"ItemCount" :: Maybe (Int) , "ItemNamesSizeBytes" :: Maybe (Number) , "AttributeNameCount" :: Maybe (Int) , "AttributeNamesSizeBytes" :: Maybe (Number) , "AttributeValueCount" :: Maybe (Int) , "AttributeValuesSizeBytes" :: Maybe (Number) , "Timestamp" :: Maybe (Int) } ) -> DomainMetadataResult
newDomainMetadataResult'  customize = (DomainMetadataResult <<< customize) { "AttributeNameCount": Nothing, "AttributeNamesSizeBytes": Nothing, "AttributeValueCount": Nothing, "AttributeValuesSizeBytes": Nothing, "ItemCount": Nothing, "ItemNamesSizeBytes": Nothing, "Timestamp": Nothing }



newtype DomainNameList = DomainNameList (Array String)
derive instance newtypeDomainNameList :: Newtype DomainNameList _
derive instance repGenericDomainNameList :: Generic DomainNameList _
instance showDomainNameList :: Show DomainNameList where show = genericShow
instance decodeDomainNameList :: Decode DomainNameList where decode = genericDecode options
instance encodeDomainNameList :: Encode DomainNameList where encode = genericEncode options



-- | <p>The item name was specified more than once. </p>
newtype DuplicateItemName = DuplicateItemName 
  { "BoxUsage" :: Maybe (Number)
  }
derive instance newtypeDuplicateItemName :: Newtype DuplicateItemName _
derive instance repGenericDuplicateItemName :: Generic DuplicateItemName _
instance showDuplicateItemName :: Show DuplicateItemName where show = genericShow
instance decodeDuplicateItemName :: Decode DuplicateItemName where decode = genericDecode options
instance encodeDuplicateItemName :: Encode DuplicateItemName where encode = genericEncode options

-- | Constructs DuplicateItemName from required parameters
newDuplicateItemName :: DuplicateItemName
newDuplicateItemName  = DuplicateItemName { "BoxUsage": Nothing }

-- | Constructs DuplicateItemName's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDuplicateItemName' :: ( { "BoxUsage" :: Maybe (Number) } -> {"BoxUsage" :: Maybe (Number) } ) -> DuplicateItemName
newDuplicateItemName'  customize = (DuplicateItemName <<< customize) { "BoxUsage": Nothing }



newtype GetAttributesRequest = GetAttributesRequest 
  { "DomainName" :: (String)
  , "ItemName" :: (String)
  , "AttributeNames" :: Maybe (AttributeNameList)
  , "ConsistentRead" :: Maybe (Boolean)
  }
derive instance newtypeGetAttributesRequest :: Newtype GetAttributesRequest _
derive instance repGenericGetAttributesRequest :: Generic GetAttributesRequest _
instance showGetAttributesRequest :: Show GetAttributesRequest where show = genericShow
instance decodeGetAttributesRequest :: Decode GetAttributesRequest where decode = genericDecode options
instance encodeGetAttributesRequest :: Encode GetAttributesRequest where encode = genericEncode options

-- | Constructs GetAttributesRequest from required parameters
newGetAttributesRequest :: String -> String -> GetAttributesRequest
newGetAttributesRequest _DomainName _ItemName = GetAttributesRequest { "DomainName": _DomainName, "ItemName": _ItemName, "AttributeNames": Nothing, "ConsistentRead": Nothing }

-- | Constructs GetAttributesRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newGetAttributesRequest' :: String -> String -> ( { "DomainName" :: (String) , "ItemName" :: (String) , "AttributeNames" :: Maybe (AttributeNameList) , "ConsistentRead" :: Maybe (Boolean) } -> {"DomainName" :: (String) , "ItemName" :: (String) , "AttributeNames" :: Maybe (AttributeNameList) , "ConsistentRead" :: Maybe (Boolean) } ) -> GetAttributesRequest
newGetAttributesRequest' _DomainName _ItemName customize = (GetAttributesRequest <<< customize) { "DomainName": _DomainName, "ItemName": _ItemName, "AttributeNames": Nothing, "ConsistentRead": Nothing }



newtype GetAttributesResult = GetAttributesResult 
  { "Attributes" :: Maybe (AttributeList)
  }
derive instance newtypeGetAttributesResult :: Newtype GetAttributesResult _
derive instance repGenericGetAttributesResult :: Generic GetAttributesResult _
instance showGetAttributesResult :: Show GetAttributesResult where show = genericShow
instance decodeGetAttributesResult :: Decode GetAttributesResult where decode = genericDecode options
instance encodeGetAttributesResult :: Encode GetAttributesResult where encode = genericEncode options

-- | Constructs GetAttributesResult from required parameters
newGetAttributesResult :: GetAttributesResult
newGetAttributesResult  = GetAttributesResult { "Attributes": Nothing }

-- | Constructs GetAttributesResult's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newGetAttributesResult' :: ( { "Attributes" :: Maybe (AttributeList) } -> {"Attributes" :: Maybe (AttributeList) } ) -> GetAttributesResult
newGetAttributesResult'  customize = (GetAttributesResult <<< customize) { "Attributes": Nothing }



-- | <p>The specified NextToken is not valid. </p>
newtype InvalidNextToken = InvalidNextToken 
  { "BoxUsage" :: Maybe (Number)
  }
derive instance newtypeInvalidNextToken :: Newtype InvalidNextToken _
derive instance repGenericInvalidNextToken :: Generic InvalidNextToken _
instance showInvalidNextToken :: Show InvalidNextToken where show = genericShow
instance decodeInvalidNextToken :: Decode InvalidNextToken where decode = genericDecode options
instance encodeInvalidNextToken :: Encode InvalidNextToken where encode = genericEncode options

-- | Constructs InvalidNextToken from required parameters
newInvalidNextToken :: InvalidNextToken
newInvalidNextToken  = InvalidNextToken { "BoxUsage": Nothing }

-- | Constructs InvalidNextToken's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newInvalidNextToken' :: ( { "BoxUsage" :: Maybe (Number) } -> {"BoxUsage" :: Maybe (Number) } ) -> InvalidNextToken
newInvalidNextToken'  customize = (InvalidNextToken <<< customize) { "BoxUsage": Nothing }



-- | <p>Too many predicates exist in the query expression.</p>
newtype InvalidNumberPredicates = InvalidNumberPredicates 
  { "BoxUsage" :: Maybe (Number)
  }
derive instance newtypeInvalidNumberPredicates :: Newtype InvalidNumberPredicates _
derive instance repGenericInvalidNumberPredicates :: Generic InvalidNumberPredicates _
instance showInvalidNumberPredicates :: Show InvalidNumberPredicates where show = genericShow
instance decodeInvalidNumberPredicates :: Decode InvalidNumberPredicates where decode = genericDecode options
instance encodeInvalidNumberPredicates :: Encode InvalidNumberPredicates where encode = genericEncode options

-- | Constructs InvalidNumberPredicates from required parameters
newInvalidNumberPredicates :: InvalidNumberPredicates
newInvalidNumberPredicates  = InvalidNumberPredicates { "BoxUsage": Nothing }

-- | Constructs InvalidNumberPredicates's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newInvalidNumberPredicates' :: ( { "BoxUsage" :: Maybe (Number) } -> {"BoxUsage" :: Maybe (Number) } ) -> InvalidNumberPredicates
newInvalidNumberPredicates'  customize = (InvalidNumberPredicates <<< customize) { "BoxUsage": Nothing }



-- | <p>Too many predicates exist in the query expression.</p>
newtype InvalidNumberValueTests = InvalidNumberValueTests 
  { "BoxUsage" :: Maybe (Number)
  }
derive instance newtypeInvalidNumberValueTests :: Newtype InvalidNumberValueTests _
derive instance repGenericInvalidNumberValueTests :: Generic InvalidNumberValueTests _
instance showInvalidNumberValueTests :: Show InvalidNumberValueTests where show = genericShow
instance decodeInvalidNumberValueTests :: Decode InvalidNumberValueTests where decode = genericDecode options
instance encodeInvalidNumberValueTests :: Encode InvalidNumberValueTests where encode = genericEncode options

-- | Constructs InvalidNumberValueTests from required parameters
newInvalidNumberValueTests :: InvalidNumberValueTests
newInvalidNumberValueTests  = InvalidNumberValueTests { "BoxUsage": Nothing }

-- | Constructs InvalidNumberValueTests's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newInvalidNumberValueTests' :: ( { "BoxUsage" :: Maybe (Number) } -> {"BoxUsage" :: Maybe (Number) } ) -> InvalidNumberValueTests
newInvalidNumberValueTests'  customize = (InvalidNumberValueTests <<< customize) { "BoxUsage": Nothing }



-- | <p>The value for a parameter is invalid.</p>
newtype InvalidParameterValue = InvalidParameterValue 
  { "BoxUsage" :: Maybe (Number)
  }
derive instance newtypeInvalidParameterValue :: Newtype InvalidParameterValue _
derive instance repGenericInvalidParameterValue :: Generic InvalidParameterValue _
instance showInvalidParameterValue :: Show InvalidParameterValue where show = genericShow
instance decodeInvalidParameterValue :: Decode InvalidParameterValue where decode = genericDecode options
instance encodeInvalidParameterValue :: Encode InvalidParameterValue where encode = genericEncode options

-- | Constructs InvalidParameterValue from required parameters
newInvalidParameterValue :: InvalidParameterValue
newInvalidParameterValue  = InvalidParameterValue { "BoxUsage": Nothing }

-- | Constructs InvalidParameterValue's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newInvalidParameterValue' :: ( { "BoxUsage" :: Maybe (Number) } -> {"BoxUsage" :: Maybe (Number) } ) -> InvalidParameterValue
newInvalidParameterValue'  customize = (InvalidParameterValue <<< customize) { "BoxUsage": Nothing }



-- | <p>The specified query expression syntax is not valid.</p>
newtype InvalidQueryExpression = InvalidQueryExpression 
  { "BoxUsage" :: Maybe (Number)
  }
derive instance newtypeInvalidQueryExpression :: Newtype InvalidQueryExpression _
derive instance repGenericInvalidQueryExpression :: Generic InvalidQueryExpression _
instance showInvalidQueryExpression :: Show InvalidQueryExpression where show = genericShow
instance decodeInvalidQueryExpression :: Decode InvalidQueryExpression where decode = genericDecode options
instance encodeInvalidQueryExpression :: Encode InvalidQueryExpression where encode = genericEncode options

-- | Constructs InvalidQueryExpression from required parameters
newInvalidQueryExpression :: InvalidQueryExpression
newInvalidQueryExpression  = InvalidQueryExpression { "BoxUsage": Nothing }

-- | Constructs InvalidQueryExpression's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newInvalidQueryExpression' :: ( { "BoxUsage" :: Maybe (Number) } -> {"BoxUsage" :: Maybe (Number) } ) -> InvalidQueryExpression
newInvalidQueryExpression'  customize = (InvalidQueryExpression <<< customize) { "BoxUsage": Nothing }



-- | <p></p>
newtype Item = Item 
  { "Name" :: (String)
  , "AlternateNameEncoding" :: Maybe (String)
  , "Attributes" :: (AttributeList)
  }
derive instance newtypeItem :: Newtype Item _
derive instance repGenericItem :: Generic Item _
instance showItem :: Show Item where show = genericShow
instance decodeItem :: Decode Item where decode = genericDecode options
instance encodeItem :: Encode Item where encode = genericEncode options

-- | Constructs Item from required parameters
newItem :: AttributeList -> String -> Item
newItem _Attributes _Name = Item { "Attributes": _Attributes, "Name": _Name, "AlternateNameEncoding": Nothing }

-- | Constructs Item's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newItem' :: AttributeList -> String -> ( { "Name" :: (String) , "AlternateNameEncoding" :: Maybe (String) , "Attributes" :: (AttributeList) } -> {"Name" :: (String) , "AlternateNameEncoding" :: Maybe (String) , "Attributes" :: (AttributeList) } ) -> Item
newItem' _Attributes _Name customize = (Item <<< customize) { "Attributes": _Attributes, "Name": _Name, "AlternateNameEncoding": Nothing }



newtype ItemList = ItemList (Array Item)
derive instance newtypeItemList :: Newtype ItemList _
derive instance repGenericItemList :: Generic ItemList _
instance showItemList :: Show ItemList where show = genericShow
instance decodeItemList :: Decode ItemList where decode = genericDecode options
instance encodeItemList :: Encode ItemList where encode = genericEncode options



newtype ListDomainsRequest = ListDomainsRequest 
  { "MaxNumberOfDomains" :: Maybe (Int)
  , "NextToken" :: Maybe (String)
  }
derive instance newtypeListDomainsRequest :: Newtype ListDomainsRequest _
derive instance repGenericListDomainsRequest :: Generic ListDomainsRequest _
instance showListDomainsRequest :: Show ListDomainsRequest where show = genericShow
instance decodeListDomainsRequest :: Decode ListDomainsRequest where decode = genericDecode options
instance encodeListDomainsRequest :: Encode ListDomainsRequest where encode = genericEncode options

-- | Constructs ListDomainsRequest from required parameters
newListDomainsRequest :: ListDomainsRequest
newListDomainsRequest  = ListDomainsRequest { "MaxNumberOfDomains": Nothing, "NextToken": Nothing }

-- | Constructs ListDomainsRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newListDomainsRequest' :: ( { "MaxNumberOfDomains" :: Maybe (Int) , "NextToken" :: Maybe (String) } -> {"MaxNumberOfDomains" :: Maybe (Int) , "NextToken" :: Maybe (String) } ) -> ListDomainsRequest
newListDomainsRequest'  customize = (ListDomainsRequest <<< customize) { "MaxNumberOfDomains": Nothing, "NextToken": Nothing }



newtype ListDomainsResult = ListDomainsResult 
  { "DomainNames" :: Maybe (DomainNameList)
  , "NextToken" :: Maybe (String)
  }
derive instance newtypeListDomainsResult :: Newtype ListDomainsResult _
derive instance repGenericListDomainsResult :: Generic ListDomainsResult _
instance showListDomainsResult :: Show ListDomainsResult where show = genericShow
instance decodeListDomainsResult :: Decode ListDomainsResult where decode = genericDecode options
instance encodeListDomainsResult :: Encode ListDomainsResult where encode = genericEncode options

-- | Constructs ListDomainsResult from required parameters
newListDomainsResult :: ListDomainsResult
newListDomainsResult  = ListDomainsResult { "DomainNames": Nothing, "NextToken": Nothing }

-- | Constructs ListDomainsResult's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newListDomainsResult' :: ( { "DomainNames" :: Maybe (DomainNameList) , "NextToken" :: Maybe (String) } -> {"DomainNames" :: Maybe (DomainNameList) , "NextToken" :: Maybe (String) } ) -> ListDomainsResult
newListDomainsResult'  customize = (ListDomainsResult <<< customize) { "DomainNames": Nothing, "NextToken": Nothing }



-- | <p>The request must contain the specified missing parameter.</p>
newtype MissingParameter = MissingParameter 
  { "BoxUsage" :: Maybe (Number)
  }
derive instance newtypeMissingParameter :: Newtype MissingParameter _
derive instance repGenericMissingParameter :: Generic MissingParameter _
instance showMissingParameter :: Show MissingParameter where show = genericShow
instance decodeMissingParameter :: Decode MissingParameter where decode = genericDecode options
instance encodeMissingParameter :: Encode MissingParameter where encode = genericEncode options

-- | Constructs MissingParameter from required parameters
newMissingParameter :: MissingParameter
newMissingParameter  = MissingParameter { "BoxUsage": Nothing }

-- | Constructs MissingParameter's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newMissingParameter' :: ( { "BoxUsage" :: Maybe (Number) } -> {"BoxUsage" :: Maybe (Number) } ) -> MissingParameter
newMissingParameter'  customize = (MissingParameter <<< customize) { "BoxUsage": Nothing }



-- | <p>The specified domain does not exist.</p>
newtype NoSuchDomain = NoSuchDomain 
  { "BoxUsage" :: Maybe (Number)
  }
derive instance newtypeNoSuchDomain :: Newtype NoSuchDomain _
derive instance repGenericNoSuchDomain :: Generic NoSuchDomain _
instance showNoSuchDomain :: Show NoSuchDomain where show = genericShow
instance decodeNoSuchDomain :: Decode NoSuchDomain where decode = genericDecode options
instance encodeNoSuchDomain :: Encode NoSuchDomain where encode = genericEncode options

-- | Constructs NoSuchDomain from required parameters
newNoSuchDomain :: NoSuchDomain
newNoSuchDomain  = NoSuchDomain { "BoxUsage": Nothing }

-- | Constructs NoSuchDomain's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newNoSuchDomain' :: ( { "BoxUsage" :: Maybe (Number) } -> {"BoxUsage" :: Maybe (Number) } ) -> NoSuchDomain
newNoSuchDomain'  customize = (NoSuchDomain <<< customize) { "BoxUsage": Nothing }



-- | <p>Too many attributes in this domain.</p>
newtype NumberDomainAttributesExceeded = NumberDomainAttributesExceeded 
  { "BoxUsage" :: Maybe (Number)
  }
derive instance newtypeNumberDomainAttributesExceeded :: Newtype NumberDomainAttributesExceeded _
derive instance repGenericNumberDomainAttributesExceeded :: Generic NumberDomainAttributesExceeded _
instance showNumberDomainAttributesExceeded :: Show NumberDomainAttributesExceeded where show = genericShow
instance decodeNumberDomainAttributesExceeded :: Decode NumberDomainAttributesExceeded where decode = genericDecode options
instance encodeNumberDomainAttributesExceeded :: Encode NumberDomainAttributesExceeded where encode = genericEncode options

-- | Constructs NumberDomainAttributesExceeded from required parameters
newNumberDomainAttributesExceeded :: NumberDomainAttributesExceeded
newNumberDomainAttributesExceeded  = NumberDomainAttributesExceeded { "BoxUsage": Nothing }

-- | Constructs NumberDomainAttributesExceeded's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newNumberDomainAttributesExceeded' :: ( { "BoxUsage" :: Maybe (Number) } -> {"BoxUsage" :: Maybe (Number) } ) -> NumberDomainAttributesExceeded
newNumberDomainAttributesExceeded'  customize = (NumberDomainAttributesExceeded <<< customize) { "BoxUsage": Nothing }



-- | <p>Too many bytes in this domain.</p>
newtype NumberDomainBytesExceeded = NumberDomainBytesExceeded 
  { "BoxUsage" :: Maybe (Number)
  }
derive instance newtypeNumberDomainBytesExceeded :: Newtype NumberDomainBytesExceeded _
derive instance repGenericNumberDomainBytesExceeded :: Generic NumberDomainBytesExceeded _
instance showNumberDomainBytesExceeded :: Show NumberDomainBytesExceeded where show = genericShow
instance decodeNumberDomainBytesExceeded :: Decode NumberDomainBytesExceeded where decode = genericDecode options
instance encodeNumberDomainBytesExceeded :: Encode NumberDomainBytesExceeded where encode = genericEncode options

-- | Constructs NumberDomainBytesExceeded from required parameters
newNumberDomainBytesExceeded :: NumberDomainBytesExceeded
newNumberDomainBytesExceeded  = NumberDomainBytesExceeded { "BoxUsage": Nothing }

-- | Constructs NumberDomainBytesExceeded's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newNumberDomainBytesExceeded' :: ( { "BoxUsage" :: Maybe (Number) } -> {"BoxUsage" :: Maybe (Number) } ) -> NumberDomainBytesExceeded
newNumberDomainBytesExceeded'  customize = (NumberDomainBytesExceeded <<< customize) { "BoxUsage": Nothing }



-- | <p>Too many domains exist per this account.</p>
newtype NumberDomainsExceeded = NumberDomainsExceeded 
  { "BoxUsage" :: Maybe (Number)
  }
derive instance newtypeNumberDomainsExceeded :: Newtype NumberDomainsExceeded _
derive instance repGenericNumberDomainsExceeded :: Generic NumberDomainsExceeded _
instance showNumberDomainsExceeded :: Show NumberDomainsExceeded where show = genericShow
instance decodeNumberDomainsExceeded :: Decode NumberDomainsExceeded where decode = genericDecode options
instance encodeNumberDomainsExceeded :: Encode NumberDomainsExceeded where encode = genericEncode options

-- | Constructs NumberDomainsExceeded from required parameters
newNumberDomainsExceeded :: NumberDomainsExceeded
newNumberDomainsExceeded  = NumberDomainsExceeded { "BoxUsage": Nothing }

-- | Constructs NumberDomainsExceeded's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newNumberDomainsExceeded' :: ( { "BoxUsage" :: Maybe (Number) } -> {"BoxUsage" :: Maybe (Number) } ) -> NumberDomainsExceeded
newNumberDomainsExceeded'  customize = (NumberDomainsExceeded <<< customize) { "BoxUsage": Nothing }



-- | <p>Too many attributes in this item.</p>
newtype NumberItemAttributesExceeded = NumberItemAttributesExceeded 
  { "BoxUsage" :: Maybe (Number)
  }
derive instance newtypeNumberItemAttributesExceeded :: Newtype NumberItemAttributesExceeded _
derive instance repGenericNumberItemAttributesExceeded :: Generic NumberItemAttributesExceeded _
instance showNumberItemAttributesExceeded :: Show NumberItemAttributesExceeded where show = genericShow
instance decodeNumberItemAttributesExceeded :: Decode NumberItemAttributesExceeded where decode = genericDecode options
instance encodeNumberItemAttributesExceeded :: Encode NumberItemAttributesExceeded where encode = genericEncode options

-- | Constructs NumberItemAttributesExceeded from required parameters
newNumberItemAttributesExceeded :: NumberItemAttributesExceeded
newNumberItemAttributesExceeded  = NumberItemAttributesExceeded { "BoxUsage": Nothing }

-- | Constructs NumberItemAttributesExceeded's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newNumberItemAttributesExceeded' :: ( { "BoxUsage" :: Maybe (Number) } -> {"BoxUsage" :: Maybe (Number) } ) -> NumberItemAttributesExceeded
newNumberItemAttributesExceeded'  customize = (NumberItemAttributesExceeded <<< customize) { "BoxUsage": Nothing }



-- | <p>Too many attributes exist in a single call.</p>
newtype NumberSubmittedAttributesExceeded = NumberSubmittedAttributesExceeded 
  { "BoxUsage" :: Maybe (Number)
  }
derive instance newtypeNumberSubmittedAttributesExceeded :: Newtype NumberSubmittedAttributesExceeded _
derive instance repGenericNumberSubmittedAttributesExceeded :: Generic NumberSubmittedAttributesExceeded _
instance showNumberSubmittedAttributesExceeded :: Show NumberSubmittedAttributesExceeded where show = genericShow
instance decodeNumberSubmittedAttributesExceeded :: Decode NumberSubmittedAttributesExceeded where decode = genericDecode options
instance encodeNumberSubmittedAttributesExceeded :: Encode NumberSubmittedAttributesExceeded where encode = genericEncode options

-- | Constructs NumberSubmittedAttributesExceeded from required parameters
newNumberSubmittedAttributesExceeded :: NumberSubmittedAttributesExceeded
newNumberSubmittedAttributesExceeded  = NumberSubmittedAttributesExceeded { "BoxUsage": Nothing }

-- | Constructs NumberSubmittedAttributesExceeded's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newNumberSubmittedAttributesExceeded' :: ( { "BoxUsage" :: Maybe (Number) } -> {"BoxUsage" :: Maybe (Number) } ) -> NumberSubmittedAttributesExceeded
newNumberSubmittedAttributesExceeded'  customize = (NumberSubmittedAttributesExceeded <<< customize) { "BoxUsage": Nothing }



-- | <p>Too many items exist in a single call.</p>
newtype NumberSubmittedItemsExceeded = NumberSubmittedItemsExceeded 
  { "BoxUsage" :: Maybe (Number)
  }
derive instance newtypeNumberSubmittedItemsExceeded :: Newtype NumberSubmittedItemsExceeded _
derive instance repGenericNumberSubmittedItemsExceeded :: Generic NumberSubmittedItemsExceeded _
instance showNumberSubmittedItemsExceeded :: Show NumberSubmittedItemsExceeded where show = genericShow
instance decodeNumberSubmittedItemsExceeded :: Decode NumberSubmittedItemsExceeded where decode = genericDecode options
instance encodeNumberSubmittedItemsExceeded :: Encode NumberSubmittedItemsExceeded where encode = genericEncode options

-- | Constructs NumberSubmittedItemsExceeded from required parameters
newNumberSubmittedItemsExceeded :: NumberSubmittedItemsExceeded
newNumberSubmittedItemsExceeded  = NumberSubmittedItemsExceeded { "BoxUsage": Nothing }

-- | Constructs NumberSubmittedItemsExceeded's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newNumberSubmittedItemsExceeded' :: ( { "BoxUsage" :: Maybe (Number) } -> {"BoxUsage" :: Maybe (Number) } ) -> NumberSubmittedItemsExceeded
newNumberSubmittedItemsExceeded'  customize = (NumberSubmittedItemsExceeded <<< customize) { "BoxUsage": Nothing }



newtype PutAttributesRequest = PutAttributesRequest 
  { "DomainName" :: (String)
  , "ItemName" :: (String)
  , "Attributes" :: (ReplaceableAttributeList)
  , "Expected" :: Maybe (UpdateCondition)
  }
derive instance newtypePutAttributesRequest :: Newtype PutAttributesRequest _
derive instance repGenericPutAttributesRequest :: Generic PutAttributesRequest _
instance showPutAttributesRequest :: Show PutAttributesRequest where show = genericShow
instance decodePutAttributesRequest :: Decode PutAttributesRequest where decode = genericDecode options
instance encodePutAttributesRequest :: Encode PutAttributesRequest where encode = genericEncode options

-- | Constructs PutAttributesRequest from required parameters
newPutAttributesRequest :: ReplaceableAttributeList -> String -> String -> PutAttributesRequest
newPutAttributesRequest _Attributes _DomainName _ItemName = PutAttributesRequest { "Attributes": _Attributes, "DomainName": _DomainName, "ItemName": _ItemName, "Expected": Nothing }

-- | Constructs PutAttributesRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newPutAttributesRequest' :: ReplaceableAttributeList -> String -> String -> ( { "DomainName" :: (String) , "ItemName" :: (String) , "Attributes" :: (ReplaceableAttributeList) , "Expected" :: Maybe (UpdateCondition) } -> {"DomainName" :: (String) , "ItemName" :: (String) , "Attributes" :: (ReplaceableAttributeList) , "Expected" :: Maybe (UpdateCondition) } ) -> PutAttributesRequest
newPutAttributesRequest' _Attributes _DomainName _ItemName customize = (PutAttributesRequest <<< customize) { "Attributes": _Attributes, "DomainName": _DomainName, "ItemName": _ItemName, "Expected": Nothing }



-- | <p></p>
newtype ReplaceableAttribute = ReplaceableAttribute 
  { "Name" :: (String)
  , "Value" :: (String)
  , "Replace" :: Maybe (Boolean)
  }
derive instance newtypeReplaceableAttribute :: Newtype ReplaceableAttribute _
derive instance repGenericReplaceableAttribute :: Generic ReplaceableAttribute _
instance showReplaceableAttribute :: Show ReplaceableAttribute where show = genericShow
instance decodeReplaceableAttribute :: Decode ReplaceableAttribute where decode = genericDecode options
instance encodeReplaceableAttribute :: Encode ReplaceableAttribute where encode = genericEncode options

-- | Constructs ReplaceableAttribute from required parameters
newReplaceableAttribute :: String -> String -> ReplaceableAttribute
newReplaceableAttribute _Name _Value = ReplaceableAttribute { "Name": _Name, "Value": _Value, "Replace": Nothing }

-- | Constructs ReplaceableAttribute's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newReplaceableAttribute' :: String -> String -> ( { "Name" :: (String) , "Value" :: (String) , "Replace" :: Maybe (Boolean) } -> {"Name" :: (String) , "Value" :: (String) , "Replace" :: Maybe (Boolean) } ) -> ReplaceableAttribute
newReplaceableAttribute' _Name _Value customize = (ReplaceableAttribute <<< customize) { "Name": _Name, "Value": _Value, "Replace": Nothing }



newtype ReplaceableAttributeList = ReplaceableAttributeList (Array ReplaceableAttribute)
derive instance newtypeReplaceableAttributeList :: Newtype ReplaceableAttributeList _
derive instance repGenericReplaceableAttributeList :: Generic ReplaceableAttributeList _
instance showReplaceableAttributeList :: Show ReplaceableAttributeList where show = genericShow
instance decodeReplaceableAttributeList :: Decode ReplaceableAttributeList where decode = genericDecode options
instance encodeReplaceableAttributeList :: Encode ReplaceableAttributeList where encode = genericEncode options



-- | <p></p>
newtype ReplaceableItem = ReplaceableItem 
  { "Name" :: (String)
  , "Attributes" :: (ReplaceableAttributeList)
  }
derive instance newtypeReplaceableItem :: Newtype ReplaceableItem _
derive instance repGenericReplaceableItem :: Generic ReplaceableItem _
instance showReplaceableItem :: Show ReplaceableItem where show = genericShow
instance decodeReplaceableItem :: Decode ReplaceableItem where decode = genericDecode options
instance encodeReplaceableItem :: Encode ReplaceableItem where encode = genericEncode options

-- | Constructs ReplaceableItem from required parameters
newReplaceableItem :: ReplaceableAttributeList -> String -> ReplaceableItem
newReplaceableItem _Attributes _Name = ReplaceableItem { "Attributes": _Attributes, "Name": _Name }

-- | Constructs ReplaceableItem's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newReplaceableItem' :: ReplaceableAttributeList -> String -> ( { "Name" :: (String) , "Attributes" :: (ReplaceableAttributeList) } -> {"Name" :: (String) , "Attributes" :: (ReplaceableAttributeList) } ) -> ReplaceableItem
newReplaceableItem' _Attributes _Name customize = (ReplaceableItem <<< customize) { "Attributes": _Attributes, "Name": _Name }



newtype ReplaceableItemList = ReplaceableItemList (Array ReplaceableItem)
derive instance newtypeReplaceableItemList :: Newtype ReplaceableItemList _
derive instance repGenericReplaceableItemList :: Generic ReplaceableItemList _
instance showReplaceableItemList :: Show ReplaceableItemList where show = genericShow
instance decodeReplaceableItemList :: Decode ReplaceableItemList where decode = genericDecode options
instance encodeReplaceableItemList :: Encode ReplaceableItemList where encode = genericEncode options



-- | <p>A timeout occurred when attempting to query the specified domain with specified query expression.</p>
newtype RequestTimeout = RequestTimeout 
  { "BoxUsage" :: Maybe (Number)
  }
derive instance newtypeRequestTimeout :: Newtype RequestTimeout _
derive instance repGenericRequestTimeout :: Generic RequestTimeout _
instance showRequestTimeout :: Show RequestTimeout where show = genericShow
instance decodeRequestTimeout :: Decode RequestTimeout where decode = genericDecode options
instance encodeRequestTimeout :: Encode RequestTimeout where encode = genericEncode options

-- | Constructs RequestTimeout from required parameters
newRequestTimeout :: RequestTimeout
newRequestTimeout  = RequestTimeout { "BoxUsage": Nothing }

-- | Constructs RequestTimeout's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newRequestTimeout' :: ( { "BoxUsage" :: Maybe (Number) } -> {"BoxUsage" :: Maybe (Number) } ) -> RequestTimeout
newRequestTimeout'  customize = (RequestTimeout <<< customize) { "BoxUsage": Nothing }



newtype SelectRequest = SelectRequest 
  { "SelectExpression" :: (String)
  , "NextToken" :: Maybe (String)
  , "ConsistentRead" :: Maybe (Boolean)
  }
derive instance newtypeSelectRequest :: Newtype SelectRequest _
derive instance repGenericSelectRequest :: Generic SelectRequest _
instance showSelectRequest :: Show SelectRequest where show = genericShow
instance decodeSelectRequest :: Decode SelectRequest where decode = genericDecode options
instance encodeSelectRequest :: Encode SelectRequest where encode = genericEncode options

-- | Constructs SelectRequest from required parameters
newSelectRequest :: String -> SelectRequest
newSelectRequest _SelectExpression = SelectRequest { "SelectExpression": _SelectExpression, "ConsistentRead": Nothing, "NextToken": Nothing }

-- | Constructs SelectRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newSelectRequest' :: String -> ( { "SelectExpression" :: (String) , "NextToken" :: Maybe (String) , "ConsistentRead" :: Maybe (Boolean) } -> {"SelectExpression" :: (String) , "NextToken" :: Maybe (String) , "ConsistentRead" :: Maybe (Boolean) } ) -> SelectRequest
newSelectRequest' _SelectExpression customize = (SelectRequest <<< customize) { "SelectExpression": _SelectExpression, "ConsistentRead": Nothing, "NextToken": Nothing }



newtype SelectResult = SelectResult 
  { "Items" :: Maybe (ItemList)
  , "NextToken" :: Maybe (String)
  }
derive instance newtypeSelectResult :: Newtype SelectResult _
derive instance repGenericSelectResult :: Generic SelectResult _
instance showSelectResult :: Show SelectResult where show = genericShow
instance decodeSelectResult :: Decode SelectResult where decode = genericDecode options
instance encodeSelectResult :: Encode SelectResult where encode = genericEncode options

-- | Constructs SelectResult from required parameters
newSelectResult :: SelectResult
newSelectResult  = SelectResult { "Items": Nothing, "NextToken": Nothing }

-- | Constructs SelectResult's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newSelectResult' :: ( { "Items" :: Maybe (ItemList) , "NextToken" :: Maybe (String) } -> {"Items" :: Maybe (ItemList) , "NextToken" :: Maybe (String) } ) -> SelectResult
newSelectResult'  customize = (SelectResult <<< customize) { "Items": Nothing, "NextToken": Nothing }



-- | <p>Too many attributes requested.</p>
newtype TooManyRequestedAttributes = TooManyRequestedAttributes 
  { "BoxUsage" :: Maybe (Number)
  }
derive instance newtypeTooManyRequestedAttributes :: Newtype TooManyRequestedAttributes _
derive instance repGenericTooManyRequestedAttributes :: Generic TooManyRequestedAttributes _
instance showTooManyRequestedAttributes :: Show TooManyRequestedAttributes where show = genericShow
instance decodeTooManyRequestedAttributes :: Decode TooManyRequestedAttributes where decode = genericDecode options
instance encodeTooManyRequestedAttributes :: Encode TooManyRequestedAttributes where encode = genericEncode options

-- | Constructs TooManyRequestedAttributes from required parameters
newTooManyRequestedAttributes :: TooManyRequestedAttributes
newTooManyRequestedAttributes  = TooManyRequestedAttributes { "BoxUsage": Nothing }

-- | Constructs TooManyRequestedAttributes's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newTooManyRequestedAttributes' :: ( { "BoxUsage" :: Maybe (Number) } -> {"BoxUsage" :: Maybe (Number) } ) -> TooManyRequestedAttributes
newTooManyRequestedAttributes'  customize = (TooManyRequestedAttributes <<< customize) { "BoxUsage": Nothing }



-- | <p> Specifies the conditions under which data should be updated. If an update condition is specified for a request, the data will only be updated if the condition is satisfied. For example, if an attribute with a specific name and value exists, or if a specific attribute doesn't exist. </p>
newtype UpdateCondition = UpdateCondition 
  { "Name" :: Maybe (String)
  , "Value" :: Maybe (String)
  , "Exists" :: Maybe (Boolean)
  }
derive instance newtypeUpdateCondition :: Newtype UpdateCondition _
derive instance repGenericUpdateCondition :: Generic UpdateCondition _
instance showUpdateCondition :: Show UpdateCondition where show = genericShow
instance decodeUpdateCondition :: Decode UpdateCondition where decode = genericDecode options
instance encodeUpdateCondition :: Encode UpdateCondition where encode = genericEncode options

-- | Constructs UpdateCondition from required parameters
newUpdateCondition :: UpdateCondition
newUpdateCondition  = UpdateCondition { "Exists": Nothing, "Name": Nothing, "Value": Nothing }

-- | Constructs UpdateCondition's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newUpdateCondition' :: ( { "Name" :: Maybe (String) , "Value" :: Maybe (String) , "Exists" :: Maybe (Boolean) } -> {"Name" :: Maybe (String) , "Value" :: Maybe (String) , "Exists" :: Maybe (Boolean) } ) -> UpdateCondition
newUpdateCondition'  customize = (UpdateCondition <<< customize) { "Exists": Nothing, "Name": Nothing, "Value": Nothing }

