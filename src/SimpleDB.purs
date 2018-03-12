

-- | Amazon SimpleDB is a web service providing the core database functions of data indexing and querying in the cloud. By offloading the time and effort associated with building and operating a web-scale database, SimpleDB provides developers the freedom to focus on application development. <p> A traditional, clustered relational database requires a sizable upfront capital outlay, is complex to design, and often requires extensive and repetitive database administration. Amazon SimpleDB is dramatically simpler, requiring no schema, automatically indexing your data and providing a simple API for storage and access. This approach eliminates the administrative burden of data modeling, index maintenance, and performance tuning. Developers gain access to this functionality within Amazon's proven computing environment, are able to scale instantly, and pay only for what they use. </p> <p> Visit <a href="http://aws.amazon.com/simpledb/">http://aws.amazon.com/simpledb/</a> for more information. </p>
module AWS.SimpleDB where

import Prelude
import Control.Monad.Aff (Aff)
import Control.Monad.Eff.Exception (EXCEPTION)
import Data.Foreign as Foreign
import Data.Foreign.NullOrUndefined (NullOrUndefined(..))
import Data.Foreign.Class (class Decode, class Encode)
import Data.Foreign.Generic (defaultOptions, genericDecode, genericEncode)
import Data.Foreign.NullOrUndefined as NullOrUndefined
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Maybe (Maybe(..))
import Data.Newtype (class Newtype)
import Data.StrMap as StrMap

import AWS.Request as Request
import AWS.Request.Types as Types


-- | <p> Performs multiple DeleteAttributes operations in a single call, which reduces round trips and latencies. This enables Amazon SimpleDB to optimize requests, which generally yields better throughput. </p> <note> <p> If you specify BatchDeleteAttributes without attributes or values, all the attributes for the item are deleted. </p> <p> BatchDeleteAttributes is an idempotent operation; running it multiple times on the same item or attribute doesn't result in an error. </p> <p> The BatchDeleteAttributes operation succeeds or fails in its entirety. There are no partial deletes. You can execute multiple BatchDeleteAttributes operations and other operations in parallel. However, large numbers of concurrent BatchDeleteAttributes calls can result in Service Unavailable (503) responses. </p> <p> This operation is vulnerable to exceeding the maximum URL size when making a REST request using the HTTP GET method. </p> <p> This operation does not support conditions using Expected.X.Name, Expected.X.Value, or Expected.X.Exists. </p> </note> <p> The following limitations are enforced for this operation: <ul> <li>1 MB request size</li> <li>25 item limit per BatchDeleteAttributes operation</li> </ul> </p>
batchDeleteAttributes :: forall eff. BatchDeleteAttributesRequest -> Aff (exception :: EXCEPTION | eff) Types.NoOutput
batchDeleteAttributes = Request.request service method  where
    service = Request.ServiceName "SimpleDB"
    method = Request.MethodName "batchDeleteAttributes"


-- | <p> The <code>BatchPutAttributes</code> operation creates or replaces attributes within one or more items. By using this operation, the client can perform multiple <a>PutAttribute</a> operation with a single call. This helps yield savings in round trips and latencies, enabling Amazon SimpleDB to optimize requests and generally produce better throughput. </p> <p> The client may specify the item name with the <code>Item.X.ItemName</code> parameter. The client may specify new attributes using a combination of the <code>Item.X.Attribute.Y.Name</code> and <code>Item.X.Attribute.Y.Value</code> parameters. The client may specify the first attribute for the first item using the parameters <code>Item.0.Attribute.0.Name</code> and <code>Item.0.Attribute.0.Value</code>, and for the second attribute for the first item by the parameters <code>Item.0.Attribute.1.Name</code> and <code>Item.0.Attribute.1.Value</code>, and so on. </p> <p> Attributes are uniquely identified within an item by their name/value combination. For example, a single item can have the attributes <code>{ "first_name", "first_value" }</code> and <code>{ "first_name", "second_value" }</code>. However, it cannot have two attribute instances where both the <code>Item.X.Attribute.Y.Name</code> and <code>Item.X.Attribute.Y.Value</code> are the same. </p> <p> Optionally, the requester can supply the <code>Replace</code> parameter for each individual value. Setting this value to <code>true</code> will cause the new attribute values to replace the existing attribute values. For example, if an item <code>I</code> has the attributes <code>{ 'a', '1' }, { 'b', '2'}</code> and <code>{ 'b', '3' }</code> and the requester does a BatchPutAttributes of <code>{'I', 'b', '4' }</code> with the Replace parameter set to true, the final attributes of the item will be <code>{ 'a', '1' }</code> and <code>{ 'b', '4' }</code>, replacing the previous values of the 'b' attribute with the new value. </p> <note> You cannot specify an empty string as an item or as an attribute name. The <code>BatchPutAttributes</code> operation succeeds or fails in its entirety. There are no partial puts. </note> <important> This operation is vulnerable to exceeding the maximum URL size when making a REST request using the HTTP GET method. This operation does not support conditions using <code>Expected.X.Name</code>, <code>Expected.X.Value</code>, or <code>Expected.X.Exists</code>. </important> <p> You can execute multiple <code>BatchPutAttributes</code> operations and other operations in parallel. However, large numbers of concurrent <code>BatchPutAttributes</code> calls can result in Service Unavailable (503) responses. </p> <p> The following limitations are enforced for this operation: <ul> <li>256 attribute name-value pairs per item</li> <li>1 MB request size</li> <li>1 billion attributes per domain</li> <li>10 GB of total user data storage per domain</li> <li>25 item limit per <code>BatchPutAttributes</code> operation</li> </ul> </p>
batchPutAttributes :: forall eff. BatchPutAttributesRequest -> Aff (exception :: EXCEPTION | eff) Types.NoOutput
batchPutAttributes = Request.request service method  where
    service = Request.ServiceName "SimpleDB"
    method = Request.MethodName "batchPutAttributes"


-- | <p> The <code>CreateDomain</code> operation creates a new domain. The domain name should be unique among the domains associated with the Access Key ID provided in the request. The <code>CreateDomain</code> operation may take 10 or more seconds to complete. </p> <note> CreateDomain is an idempotent operation; running it multiple times using the same domain name will not result in an error response. </note> <p> The client can create up to 100 domains per account. </p> <p> If the client requires additional domains, go to <a href="http://aws.amazon.com/contact-us/simpledb-limit-request/"> http://aws.amazon.com/contact-us/simpledb-limit-request/</a>. </p>
createDomain :: forall eff. CreateDomainRequest -> Aff (exception :: EXCEPTION | eff) Types.NoOutput
createDomain = Request.request service method  where
    service = Request.ServiceName "SimpleDB"
    method = Request.MethodName "createDomain"


-- | <p> Deletes one or more attributes associated with an item. If all attributes of the item are deleted, the item is deleted. </p> <note> If <code>DeleteAttributes</code> is called without being passed any attributes or values specified, all the attributes for the item are deleted. </note> <p> <code>DeleteAttributes</code> is an idempotent operation; running it multiple times on the same item or attribute does not result in an error response. </p> <p> Because Amazon SimpleDB makes multiple copies of item data and uses an eventual consistency update model, performing a <a>GetAttributes</a> or <a>Select</a> operation (read) immediately after a <code>DeleteAttributes</code> or <a>PutAttributes</a> operation (write) might not return updated item data. </p>
deleteAttributes :: forall eff. DeleteAttributesRequest -> Aff (exception :: EXCEPTION | eff) Types.NoOutput
deleteAttributes = Request.request service method  where
    service = Request.ServiceName "SimpleDB"
    method = Request.MethodName "deleteAttributes"


-- | <p> The <code>DeleteDomain</code> operation deletes a domain. Any items (and their attributes) in the domain are deleted as well. The <code>DeleteDomain</code> operation might take 10 or more seconds to complete. </p> <note> Running <code>DeleteDomain</code> on a domain that does not exist or running the function multiple times using the same domain name will not result in an error response. </note>
deleteDomain :: forall eff. DeleteDomainRequest -> Aff (exception :: EXCEPTION | eff) Types.NoOutput
deleteDomain = Request.request service method  where
    service = Request.ServiceName "SimpleDB"
    method = Request.MethodName "deleteDomain"


-- | <p> Returns information about the domain, including when the domain was created, the number of items and attributes in the domain, and the size of the attribute names and values. </p>
domainMetadata :: forall eff. DomainMetadataRequest -> Aff (exception :: EXCEPTION | eff) DomainMetadataResult
domainMetadata = Request.request service method  where
    service = Request.ServiceName "SimpleDB"
    method = Request.MethodName "domainMetadata"


-- | <p> Returns all of the attributes associated with the specified item. Optionally, the attributes returned can be limited to one or more attributes by specifying an attribute name parameter. </p> <p> If the item does not exist on the replica that was accessed for this operation, an empty set is returned. The system does not return an error as it cannot guarantee the item does not exist on other replicas. </p> <note> If GetAttributes is called without being passed any attribute names, all the attributes for the item are returned. </note>
getAttributes :: forall eff. GetAttributesRequest -> Aff (exception :: EXCEPTION | eff) GetAttributesResult
getAttributes = Request.request service method  where
    service = Request.ServiceName "SimpleDB"
    method = Request.MethodName "getAttributes"


-- | <p> The <code>ListDomains</code> operation lists all domains associated with the Access Key ID. It returns domain names up to the limit set by <a href="#MaxNumberOfDomains">MaxNumberOfDomains</a>. A <a href="#NextToken">NextToken</a> is returned if there are more than <code>MaxNumberOfDomains</code> domains. Calling <code>ListDomains</code> successive times with the <code>NextToken</code> provided by the operation returns up to <code>MaxNumberOfDomains</code> more domain names with each successive operation call. </p>
listDomains :: forall eff. ListDomainsRequest -> Aff (exception :: EXCEPTION | eff) ListDomainsResult
listDomains = Request.request service method  where
    service = Request.ServiceName "SimpleDB"
    method = Request.MethodName "listDomains"


-- | <p> The PutAttributes operation creates or replaces attributes in an item. The client may specify new attributes using a combination of the <code>Attribute.X.Name</code> and <code>Attribute.X.Value</code> parameters. The client specifies the first attribute by the parameters <code>Attribute.0.Name</code> and <code>Attribute.0.Value</code>, the second attribute by the parameters <code>Attribute.1.Name</code> and <code>Attribute.1.Value</code>, and so on. </p> <p> Attributes are uniquely identified in an item by their name/value combination. For example, a single item can have the attributes <code>{ "first_name", "first_value" }</code> and <code>{ "first_name", second_value" }</code>. However, it cannot have two attribute instances where both the <code>Attribute.X.Name</code> and <code>Attribute.X.Value</code> are the same. </p> <p> Optionally, the requestor can supply the <code>Replace</code> parameter for each individual attribute. Setting this value to <code>true</code> causes the new attribute value to replace the existing attribute value(s). For example, if an item has the attributes <code>{ 'a', '1' }</code>, <code>{ 'b', '2'}</code> and <code>{ 'b', '3' }</code> and the requestor calls <code>PutAttributes</code> using the attributes <code>{ 'b', '4' }</code> with the <code>Replace</code> parameter set to true, the final attributes of the item are changed to <code>{ 'a', '1' }</code> and <code>{ 'b', '4' }</code>, which replaces the previous values of the 'b' attribute with the new value. </p> <note> Using <code>PutAttributes</code> to replace attribute values that do not exist will not result in an error response. </note> <p> You cannot specify an empty string as an attribute name. </p> <p> Because Amazon SimpleDB makes multiple copies of client data and uses an eventual consistency update model, an immediate <a>GetAttributes</a> or <a>Select</a> operation (read) immediately after a <a>PutAttributes</a> or <a>DeleteAttributes</a> operation (write) might not return the updated data. </p> <p> The following limitations are enforced for this operation: <ul> <li>256 total attribute name-value pairs per item</li> <li>One billion attributes per domain</li> <li>10 GB of total user data storage per domain</li> </ul> </p>
putAttributes :: forall eff. PutAttributesRequest -> Aff (exception :: EXCEPTION | eff) Types.NoOutput
putAttributes = Request.request service method  where
    service = Request.ServiceName "SimpleDB"
    method = Request.MethodName "putAttributes"


-- | <p> The <code>Select</code> operation returns a set of attributes for <code>ItemNames</code> that match the select expression. <code>Select</code> is similar to the standard SQL SELECT statement. </p> <p> The total size of the response cannot exceed 1 MB in total size. Amazon SimpleDB automatically adjusts the number of items returned per page to enforce this limit. For example, if the client asks to retrieve 2500 items, but each individual item is 10 kB in size, the system returns 100 items and an appropriate <code>NextToken</code> so the client can access the next page of results. </p> <p> For information on how to construct select expressions, see Using Select to Create Amazon SimpleDB Queries in the Developer Guide. </p>
select :: forall eff. SelectRequest -> Aff (exception :: EXCEPTION | eff) SelectResult
select = Request.request service method  where
    service = Request.ServiceName "SimpleDB"
    method = Request.MethodName "select"


-- | <p></p>
newtype Attribute = Attribute 
  { "Name" :: (String)
  , "AlternateNameEncoding" :: NullOrUndefined.NullOrUndefined (String)
  , "Value" :: (String)
  , "AlternateValueEncoding" :: NullOrUndefined.NullOrUndefined (String)
  }
derive instance newtypeAttribute :: Newtype Attribute _
derive instance repGenericAttribute :: Generic Attribute _
instance showAttribute :: Show Attribute where
  show = genericShow
instance decodeAttribute :: Decode Attribute where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeAttribute :: Encode Attribute where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs Attribute from required parameters
newAttribute :: String -> String -> Attribute
newAttribute _Name _Value = Attribute { "Name": _Name, "Value": _Value, "AlternateNameEncoding": (NullOrUndefined Nothing), "AlternateValueEncoding": (NullOrUndefined Nothing) }

-- | Constructs Attribute's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newAttribute' :: String -> String -> ( { "Name" :: (String) , "AlternateNameEncoding" :: NullOrUndefined.NullOrUndefined (String) , "Value" :: (String) , "AlternateValueEncoding" :: NullOrUndefined.NullOrUndefined (String) } -> {"Name" :: (String) , "AlternateNameEncoding" :: NullOrUndefined.NullOrUndefined (String) , "Value" :: (String) , "AlternateValueEncoding" :: NullOrUndefined.NullOrUndefined (String) } ) -> Attribute
newAttribute' _Name _Value customize = (Attribute <<< customize) { "Name": _Name, "Value": _Value, "AlternateNameEncoding": (NullOrUndefined Nothing), "AlternateValueEncoding": (NullOrUndefined Nothing) }



-- | <p>The specified attribute does not exist.</p>
newtype AttributeDoesNotExist = AttributeDoesNotExist 
  { "BoxUsage" :: NullOrUndefined.NullOrUndefined (Number)
  }
derive instance newtypeAttributeDoesNotExist :: Newtype AttributeDoesNotExist _
derive instance repGenericAttributeDoesNotExist :: Generic AttributeDoesNotExist _
instance showAttributeDoesNotExist :: Show AttributeDoesNotExist where
  show = genericShow
instance decodeAttributeDoesNotExist :: Decode AttributeDoesNotExist where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeAttributeDoesNotExist :: Encode AttributeDoesNotExist where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs AttributeDoesNotExist from required parameters
newAttributeDoesNotExist :: AttributeDoesNotExist
newAttributeDoesNotExist  = AttributeDoesNotExist { "BoxUsage": (NullOrUndefined Nothing) }

-- | Constructs AttributeDoesNotExist's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newAttributeDoesNotExist' :: ( { "BoxUsage" :: NullOrUndefined.NullOrUndefined (Number) } -> {"BoxUsage" :: NullOrUndefined.NullOrUndefined (Number) } ) -> AttributeDoesNotExist
newAttributeDoesNotExist'  customize = (AttributeDoesNotExist <<< customize) { "BoxUsage": (NullOrUndefined Nothing) }



newtype AttributeList = AttributeList (Array Attribute)
derive instance newtypeAttributeList :: Newtype AttributeList _
derive instance repGenericAttributeList :: Generic AttributeList _
instance showAttributeList :: Show AttributeList where
  show = genericShow
instance decodeAttributeList :: Decode AttributeList where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeAttributeList :: Encode AttributeList where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype AttributeNameList = AttributeNameList (Array String)
derive instance newtypeAttributeNameList :: Newtype AttributeNameList _
derive instance repGenericAttributeNameList :: Generic AttributeNameList _
instance showAttributeNameList :: Show AttributeNameList where
  show = genericShow
instance decodeAttributeNameList :: Decode AttributeNameList where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeAttributeNameList :: Encode AttributeNameList where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype BatchDeleteAttributesRequest = BatchDeleteAttributesRequest 
  { "DomainName" :: (String)
  , "Items" :: (DeletableItemList)
  }
derive instance newtypeBatchDeleteAttributesRequest :: Newtype BatchDeleteAttributesRequest _
derive instance repGenericBatchDeleteAttributesRequest :: Generic BatchDeleteAttributesRequest _
instance showBatchDeleteAttributesRequest :: Show BatchDeleteAttributesRequest where
  show = genericShow
instance decodeBatchDeleteAttributesRequest :: Decode BatchDeleteAttributesRequest where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeBatchDeleteAttributesRequest :: Encode BatchDeleteAttributesRequest where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

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
instance showBatchPutAttributesRequest :: Show BatchPutAttributesRequest where
  show = genericShow
instance decodeBatchPutAttributesRequest :: Decode BatchPutAttributesRequest where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeBatchPutAttributesRequest :: Encode BatchPutAttributesRequest where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

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
instance showCreateDomainRequest :: Show CreateDomainRequest where
  show = genericShow
instance decodeCreateDomainRequest :: Decode CreateDomainRequest where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeCreateDomainRequest :: Encode CreateDomainRequest where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

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
  , "Value" :: NullOrUndefined.NullOrUndefined (String)
  }
derive instance newtypeDeletableAttribute :: Newtype DeletableAttribute _
derive instance repGenericDeletableAttribute :: Generic DeletableAttribute _
instance showDeletableAttribute :: Show DeletableAttribute where
  show = genericShow
instance decodeDeletableAttribute :: Decode DeletableAttribute where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeDeletableAttribute :: Encode DeletableAttribute where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs DeletableAttribute from required parameters
newDeletableAttribute :: String -> DeletableAttribute
newDeletableAttribute _Name = DeletableAttribute { "Name": _Name, "Value": (NullOrUndefined Nothing) }

-- | Constructs DeletableAttribute's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDeletableAttribute' :: String -> ( { "Name" :: (String) , "Value" :: NullOrUndefined.NullOrUndefined (String) } -> {"Name" :: (String) , "Value" :: NullOrUndefined.NullOrUndefined (String) } ) -> DeletableAttribute
newDeletableAttribute' _Name customize = (DeletableAttribute <<< customize) { "Name": _Name, "Value": (NullOrUndefined Nothing) }



newtype DeletableAttributeList = DeletableAttributeList (Array DeletableAttribute)
derive instance newtypeDeletableAttributeList :: Newtype DeletableAttributeList _
derive instance repGenericDeletableAttributeList :: Generic DeletableAttributeList _
instance showDeletableAttributeList :: Show DeletableAttributeList where
  show = genericShow
instance decodeDeletableAttributeList :: Decode DeletableAttributeList where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeDeletableAttributeList :: Encode DeletableAttributeList where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype DeletableItem = DeletableItem 
  { "Name" :: (String)
  , "Attributes" :: NullOrUndefined.NullOrUndefined (DeletableAttributeList)
  }
derive instance newtypeDeletableItem :: Newtype DeletableItem _
derive instance repGenericDeletableItem :: Generic DeletableItem _
instance showDeletableItem :: Show DeletableItem where
  show = genericShow
instance decodeDeletableItem :: Decode DeletableItem where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeDeletableItem :: Encode DeletableItem where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs DeletableItem from required parameters
newDeletableItem :: String -> DeletableItem
newDeletableItem _Name = DeletableItem { "Name": _Name, "Attributes": (NullOrUndefined Nothing) }

-- | Constructs DeletableItem's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDeletableItem' :: String -> ( { "Name" :: (String) , "Attributes" :: NullOrUndefined.NullOrUndefined (DeletableAttributeList) } -> {"Name" :: (String) , "Attributes" :: NullOrUndefined.NullOrUndefined (DeletableAttributeList) } ) -> DeletableItem
newDeletableItem' _Name customize = (DeletableItem <<< customize) { "Name": _Name, "Attributes": (NullOrUndefined Nothing) }



newtype DeletableItemList = DeletableItemList (Array DeletableItem)
derive instance newtypeDeletableItemList :: Newtype DeletableItemList _
derive instance repGenericDeletableItemList :: Generic DeletableItemList _
instance showDeletableItemList :: Show DeletableItemList where
  show = genericShow
instance decodeDeletableItemList :: Decode DeletableItemList where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeDeletableItemList :: Encode DeletableItemList where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype DeleteAttributesRequest = DeleteAttributesRequest 
  { "DomainName" :: (String)
  , "ItemName" :: (String)
  , "Attributes" :: NullOrUndefined.NullOrUndefined (DeletableAttributeList)
  , "Expected" :: NullOrUndefined.NullOrUndefined (UpdateCondition)
  }
derive instance newtypeDeleteAttributesRequest :: Newtype DeleteAttributesRequest _
derive instance repGenericDeleteAttributesRequest :: Generic DeleteAttributesRequest _
instance showDeleteAttributesRequest :: Show DeleteAttributesRequest where
  show = genericShow
instance decodeDeleteAttributesRequest :: Decode DeleteAttributesRequest where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeDeleteAttributesRequest :: Encode DeleteAttributesRequest where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs DeleteAttributesRequest from required parameters
newDeleteAttributesRequest :: String -> String -> DeleteAttributesRequest
newDeleteAttributesRequest _DomainName _ItemName = DeleteAttributesRequest { "DomainName": _DomainName, "ItemName": _ItemName, "Attributes": (NullOrUndefined Nothing), "Expected": (NullOrUndefined Nothing) }

-- | Constructs DeleteAttributesRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDeleteAttributesRequest' :: String -> String -> ( { "DomainName" :: (String) , "ItemName" :: (String) , "Attributes" :: NullOrUndefined.NullOrUndefined (DeletableAttributeList) , "Expected" :: NullOrUndefined.NullOrUndefined (UpdateCondition) } -> {"DomainName" :: (String) , "ItemName" :: (String) , "Attributes" :: NullOrUndefined.NullOrUndefined (DeletableAttributeList) , "Expected" :: NullOrUndefined.NullOrUndefined (UpdateCondition) } ) -> DeleteAttributesRequest
newDeleteAttributesRequest' _DomainName _ItemName customize = (DeleteAttributesRequest <<< customize) { "DomainName": _DomainName, "ItemName": _ItemName, "Attributes": (NullOrUndefined Nothing), "Expected": (NullOrUndefined Nothing) }



newtype DeleteDomainRequest = DeleteDomainRequest 
  { "DomainName" :: (String)
  }
derive instance newtypeDeleteDomainRequest :: Newtype DeleteDomainRequest _
derive instance repGenericDeleteDomainRequest :: Generic DeleteDomainRequest _
instance showDeleteDomainRequest :: Show DeleteDomainRequest where
  show = genericShow
instance decodeDeleteDomainRequest :: Decode DeleteDomainRequest where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeDeleteDomainRequest :: Encode DeleteDomainRequest where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

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
instance showDomainMetadataRequest :: Show DomainMetadataRequest where
  show = genericShow
instance decodeDomainMetadataRequest :: Decode DomainMetadataRequest where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeDomainMetadataRequest :: Encode DomainMetadataRequest where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs DomainMetadataRequest from required parameters
newDomainMetadataRequest :: String -> DomainMetadataRequest
newDomainMetadataRequest _DomainName = DomainMetadataRequest { "DomainName": _DomainName }

-- | Constructs DomainMetadataRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDomainMetadataRequest' :: String -> ( { "DomainName" :: (String) } -> {"DomainName" :: (String) } ) -> DomainMetadataRequest
newDomainMetadataRequest' _DomainName customize = (DomainMetadataRequest <<< customize) { "DomainName": _DomainName }



newtype DomainMetadataResult = DomainMetadataResult 
  { "ItemCount" :: NullOrUndefined.NullOrUndefined (Int)
  , "ItemNamesSizeBytes" :: NullOrUndefined.NullOrUndefined (Number)
  , "AttributeNameCount" :: NullOrUndefined.NullOrUndefined (Int)
  , "AttributeNamesSizeBytes" :: NullOrUndefined.NullOrUndefined (Number)
  , "AttributeValueCount" :: NullOrUndefined.NullOrUndefined (Int)
  , "AttributeValuesSizeBytes" :: NullOrUndefined.NullOrUndefined (Number)
  , "Timestamp" :: NullOrUndefined.NullOrUndefined (Int)
  }
derive instance newtypeDomainMetadataResult :: Newtype DomainMetadataResult _
derive instance repGenericDomainMetadataResult :: Generic DomainMetadataResult _
instance showDomainMetadataResult :: Show DomainMetadataResult where
  show = genericShow
instance decodeDomainMetadataResult :: Decode DomainMetadataResult where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeDomainMetadataResult :: Encode DomainMetadataResult where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs DomainMetadataResult from required parameters
newDomainMetadataResult :: DomainMetadataResult
newDomainMetadataResult  = DomainMetadataResult { "AttributeNameCount": (NullOrUndefined Nothing), "AttributeNamesSizeBytes": (NullOrUndefined Nothing), "AttributeValueCount": (NullOrUndefined Nothing), "AttributeValuesSizeBytes": (NullOrUndefined Nothing), "ItemCount": (NullOrUndefined Nothing), "ItemNamesSizeBytes": (NullOrUndefined Nothing), "Timestamp": (NullOrUndefined Nothing) }

-- | Constructs DomainMetadataResult's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDomainMetadataResult' :: ( { "ItemCount" :: NullOrUndefined.NullOrUndefined (Int) , "ItemNamesSizeBytes" :: NullOrUndefined.NullOrUndefined (Number) , "AttributeNameCount" :: NullOrUndefined.NullOrUndefined (Int) , "AttributeNamesSizeBytes" :: NullOrUndefined.NullOrUndefined (Number) , "AttributeValueCount" :: NullOrUndefined.NullOrUndefined (Int) , "AttributeValuesSizeBytes" :: NullOrUndefined.NullOrUndefined (Number) , "Timestamp" :: NullOrUndefined.NullOrUndefined (Int) } -> {"ItemCount" :: NullOrUndefined.NullOrUndefined (Int) , "ItemNamesSizeBytes" :: NullOrUndefined.NullOrUndefined (Number) , "AttributeNameCount" :: NullOrUndefined.NullOrUndefined (Int) , "AttributeNamesSizeBytes" :: NullOrUndefined.NullOrUndefined (Number) , "AttributeValueCount" :: NullOrUndefined.NullOrUndefined (Int) , "AttributeValuesSizeBytes" :: NullOrUndefined.NullOrUndefined (Number) , "Timestamp" :: NullOrUndefined.NullOrUndefined (Int) } ) -> DomainMetadataResult
newDomainMetadataResult'  customize = (DomainMetadataResult <<< customize) { "AttributeNameCount": (NullOrUndefined Nothing), "AttributeNamesSizeBytes": (NullOrUndefined Nothing), "AttributeValueCount": (NullOrUndefined Nothing), "AttributeValuesSizeBytes": (NullOrUndefined Nothing), "ItemCount": (NullOrUndefined Nothing), "ItemNamesSizeBytes": (NullOrUndefined Nothing), "Timestamp": (NullOrUndefined Nothing) }



newtype DomainNameList = DomainNameList (Array String)
derive instance newtypeDomainNameList :: Newtype DomainNameList _
derive instance repGenericDomainNameList :: Generic DomainNameList _
instance showDomainNameList :: Show DomainNameList where
  show = genericShow
instance decodeDomainNameList :: Decode DomainNameList where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeDomainNameList :: Encode DomainNameList where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p>The item name was specified more than once. </p>
newtype DuplicateItemName = DuplicateItemName 
  { "BoxUsage" :: NullOrUndefined.NullOrUndefined (Number)
  }
derive instance newtypeDuplicateItemName :: Newtype DuplicateItemName _
derive instance repGenericDuplicateItemName :: Generic DuplicateItemName _
instance showDuplicateItemName :: Show DuplicateItemName where
  show = genericShow
instance decodeDuplicateItemName :: Decode DuplicateItemName where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeDuplicateItemName :: Encode DuplicateItemName where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs DuplicateItemName from required parameters
newDuplicateItemName :: DuplicateItemName
newDuplicateItemName  = DuplicateItemName { "BoxUsage": (NullOrUndefined Nothing) }

-- | Constructs DuplicateItemName's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDuplicateItemName' :: ( { "BoxUsage" :: NullOrUndefined.NullOrUndefined (Number) } -> {"BoxUsage" :: NullOrUndefined.NullOrUndefined (Number) } ) -> DuplicateItemName
newDuplicateItemName'  customize = (DuplicateItemName <<< customize) { "BoxUsage": (NullOrUndefined Nothing) }



newtype GetAttributesRequest = GetAttributesRequest 
  { "DomainName" :: (String)
  , "ItemName" :: (String)
  , "AttributeNames" :: NullOrUndefined.NullOrUndefined (AttributeNameList)
  , "ConsistentRead" :: NullOrUndefined.NullOrUndefined (Boolean)
  }
derive instance newtypeGetAttributesRequest :: Newtype GetAttributesRequest _
derive instance repGenericGetAttributesRequest :: Generic GetAttributesRequest _
instance showGetAttributesRequest :: Show GetAttributesRequest where
  show = genericShow
instance decodeGetAttributesRequest :: Decode GetAttributesRequest where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeGetAttributesRequest :: Encode GetAttributesRequest where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs GetAttributesRequest from required parameters
newGetAttributesRequest :: String -> String -> GetAttributesRequest
newGetAttributesRequest _DomainName _ItemName = GetAttributesRequest { "DomainName": _DomainName, "ItemName": _ItemName, "AttributeNames": (NullOrUndefined Nothing), "ConsistentRead": (NullOrUndefined Nothing) }

-- | Constructs GetAttributesRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newGetAttributesRequest' :: String -> String -> ( { "DomainName" :: (String) , "ItemName" :: (String) , "AttributeNames" :: NullOrUndefined.NullOrUndefined (AttributeNameList) , "ConsistentRead" :: NullOrUndefined.NullOrUndefined (Boolean) } -> {"DomainName" :: (String) , "ItemName" :: (String) , "AttributeNames" :: NullOrUndefined.NullOrUndefined (AttributeNameList) , "ConsistentRead" :: NullOrUndefined.NullOrUndefined (Boolean) } ) -> GetAttributesRequest
newGetAttributesRequest' _DomainName _ItemName customize = (GetAttributesRequest <<< customize) { "DomainName": _DomainName, "ItemName": _ItemName, "AttributeNames": (NullOrUndefined Nothing), "ConsistentRead": (NullOrUndefined Nothing) }



newtype GetAttributesResult = GetAttributesResult 
  { "Attributes" :: NullOrUndefined.NullOrUndefined (AttributeList)
  }
derive instance newtypeGetAttributesResult :: Newtype GetAttributesResult _
derive instance repGenericGetAttributesResult :: Generic GetAttributesResult _
instance showGetAttributesResult :: Show GetAttributesResult where
  show = genericShow
instance decodeGetAttributesResult :: Decode GetAttributesResult where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeGetAttributesResult :: Encode GetAttributesResult where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs GetAttributesResult from required parameters
newGetAttributesResult :: GetAttributesResult
newGetAttributesResult  = GetAttributesResult { "Attributes": (NullOrUndefined Nothing) }

-- | Constructs GetAttributesResult's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newGetAttributesResult' :: ( { "Attributes" :: NullOrUndefined.NullOrUndefined (AttributeList) } -> {"Attributes" :: NullOrUndefined.NullOrUndefined (AttributeList) } ) -> GetAttributesResult
newGetAttributesResult'  customize = (GetAttributesResult <<< customize) { "Attributes": (NullOrUndefined Nothing) }



-- | <p>The specified NextToken is not valid. </p>
newtype InvalidNextToken = InvalidNextToken 
  { "BoxUsage" :: NullOrUndefined.NullOrUndefined (Number)
  }
derive instance newtypeInvalidNextToken :: Newtype InvalidNextToken _
derive instance repGenericInvalidNextToken :: Generic InvalidNextToken _
instance showInvalidNextToken :: Show InvalidNextToken where
  show = genericShow
instance decodeInvalidNextToken :: Decode InvalidNextToken where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeInvalidNextToken :: Encode InvalidNextToken where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs InvalidNextToken from required parameters
newInvalidNextToken :: InvalidNextToken
newInvalidNextToken  = InvalidNextToken { "BoxUsage": (NullOrUndefined Nothing) }

-- | Constructs InvalidNextToken's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newInvalidNextToken' :: ( { "BoxUsage" :: NullOrUndefined.NullOrUndefined (Number) } -> {"BoxUsage" :: NullOrUndefined.NullOrUndefined (Number) } ) -> InvalidNextToken
newInvalidNextToken'  customize = (InvalidNextToken <<< customize) { "BoxUsage": (NullOrUndefined Nothing) }



-- | <p>Too many predicates exist in the query expression.</p>
newtype InvalidNumberPredicates = InvalidNumberPredicates 
  { "BoxUsage" :: NullOrUndefined.NullOrUndefined (Number)
  }
derive instance newtypeInvalidNumberPredicates :: Newtype InvalidNumberPredicates _
derive instance repGenericInvalidNumberPredicates :: Generic InvalidNumberPredicates _
instance showInvalidNumberPredicates :: Show InvalidNumberPredicates where
  show = genericShow
instance decodeInvalidNumberPredicates :: Decode InvalidNumberPredicates where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeInvalidNumberPredicates :: Encode InvalidNumberPredicates where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs InvalidNumberPredicates from required parameters
newInvalidNumberPredicates :: InvalidNumberPredicates
newInvalidNumberPredicates  = InvalidNumberPredicates { "BoxUsage": (NullOrUndefined Nothing) }

-- | Constructs InvalidNumberPredicates's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newInvalidNumberPredicates' :: ( { "BoxUsage" :: NullOrUndefined.NullOrUndefined (Number) } -> {"BoxUsage" :: NullOrUndefined.NullOrUndefined (Number) } ) -> InvalidNumberPredicates
newInvalidNumberPredicates'  customize = (InvalidNumberPredicates <<< customize) { "BoxUsage": (NullOrUndefined Nothing) }



-- | <p>Too many predicates exist in the query expression.</p>
newtype InvalidNumberValueTests = InvalidNumberValueTests 
  { "BoxUsage" :: NullOrUndefined.NullOrUndefined (Number)
  }
derive instance newtypeInvalidNumberValueTests :: Newtype InvalidNumberValueTests _
derive instance repGenericInvalidNumberValueTests :: Generic InvalidNumberValueTests _
instance showInvalidNumberValueTests :: Show InvalidNumberValueTests where
  show = genericShow
instance decodeInvalidNumberValueTests :: Decode InvalidNumberValueTests where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeInvalidNumberValueTests :: Encode InvalidNumberValueTests where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs InvalidNumberValueTests from required parameters
newInvalidNumberValueTests :: InvalidNumberValueTests
newInvalidNumberValueTests  = InvalidNumberValueTests { "BoxUsage": (NullOrUndefined Nothing) }

-- | Constructs InvalidNumberValueTests's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newInvalidNumberValueTests' :: ( { "BoxUsage" :: NullOrUndefined.NullOrUndefined (Number) } -> {"BoxUsage" :: NullOrUndefined.NullOrUndefined (Number) } ) -> InvalidNumberValueTests
newInvalidNumberValueTests'  customize = (InvalidNumberValueTests <<< customize) { "BoxUsage": (NullOrUndefined Nothing) }



-- | <p>The value for a parameter is invalid.</p>
newtype InvalidParameterValue = InvalidParameterValue 
  { "BoxUsage" :: NullOrUndefined.NullOrUndefined (Number)
  }
derive instance newtypeInvalidParameterValue :: Newtype InvalidParameterValue _
derive instance repGenericInvalidParameterValue :: Generic InvalidParameterValue _
instance showInvalidParameterValue :: Show InvalidParameterValue where
  show = genericShow
instance decodeInvalidParameterValue :: Decode InvalidParameterValue where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeInvalidParameterValue :: Encode InvalidParameterValue where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs InvalidParameterValue from required parameters
newInvalidParameterValue :: InvalidParameterValue
newInvalidParameterValue  = InvalidParameterValue { "BoxUsage": (NullOrUndefined Nothing) }

-- | Constructs InvalidParameterValue's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newInvalidParameterValue' :: ( { "BoxUsage" :: NullOrUndefined.NullOrUndefined (Number) } -> {"BoxUsage" :: NullOrUndefined.NullOrUndefined (Number) } ) -> InvalidParameterValue
newInvalidParameterValue'  customize = (InvalidParameterValue <<< customize) { "BoxUsage": (NullOrUndefined Nothing) }



-- | <p>The specified query expression syntax is not valid.</p>
newtype InvalidQueryExpression = InvalidQueryExpression 
  { "BoxUsage" :: NullOrUndefined.NullOrUndefined (Number)
  }
derive instance newtypeInvalidQueryExpression :: Newtype InvalidQueryExpression _
derive instance repGenericInvalidQueryExpression :: Generic InvalidQueryExpression _
instance showInvalidQueryExpression :: Show InvalidQueryExpression where
  show = genericShow
instance decodeInvalidQueryExpression :: Decode InvalidQueryExpression where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeInvalidQueryExpression :: Encode InvalidQueryExpression where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs InvalidQueryExpression from required parameters
newInvalidQueryExpression :: InvalidQueryExpression
newInvalidQueryExpression  = InvalidQueryExpression { "BoxUsage": (NullOrUndefined Nothing) }

-- | Constructs InvalidQueryExpression's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newInvalidQueryExpression' :: ( { "BoxUsage" :: NullOrUndefined.NullOrUndefined (Number) } -> {"BoxUsage" :: NullOrUndefined.NullOrUndefined (Number) } ) -> InvalidQueryExpression
newInvalidQueryExpression'  customize = (InvalidQueryExpression <<< customize) { "BoxUsage": (NullOrUndefined Nothing) }



-- | <p></p>
newtype Item = Item 
  { "Name" :: (String)
  , "AlternateNameEncoding" :: NullOrUndefined.NullOrUndefined (String)
  , "Attributes" :: (AttributeList)
  }
derive instance newtypeItem :: Newtype Item _
derive instance repGenericItem :: Generic Item _
instance showItem :: Show Item where
  show = genericShow
instance decodeItem :: Decode Item where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeItem :: Encode Item where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs Item from required parameters
newItem :: AttributeList -> String -> Item
newItem _Attributes _Name = Item { "Attributes": _Attributes, "Name": _Name, "AlternateNameEncoding": (NullOrUndefined Nothing) }

-- | Constructs Item's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newItem' :: AttributeList -> String -> ( { "Name" :: (String) , "AlternateNameEncoding" :: NullOrUndefined.NullOrUndefined (String) , "Attributes" :: (AttributeList) } -> {"Name" :: (String) , "AlternateNameEncoding" :: NullOrUndefined.NullOrUndefined (String) , "Attributes" :: (AttributeList) } ) -> Item
newItem' _Attributes _Name customize = (Item <<< customize) { "Attributes": _Attributes, "Name": _Name, "AlternateNameEncoding": (NullOrUndefined Nothing) }



newtype ItemList = ItemList (Array Item)
derive instance newtypeItemList :: Newtype ItemList _
derive instance repGenericItemList :: Generic ItemList _
instance showItemList :: Show ItemList where
  show = genericShow
instance decodeItemList :: Decode ItemList where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeItemList :: Encode ItemList where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype ListDomainsRequest = ListDomainsRequest 
  { "MaxNumberOfDomains" :: NullOrUndefined.NullOrUndefined (Int)
  , "NextToken" :: NullOrUndefined.NullOrUndefined (String)
  }
derive instance newtypeListDomainsRequest :: Newtype ListDomainsRequest _
derive instance repGenericListDomainsRequest :: Generic ListDomainsRequest _
instance showListDomainsRequest :: Show ListDomainsRequest where
  show = genericShow
instance decodeListDomainsRequest :: Decode ListDomainsRequest where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeListDomainsRequest :: Encode ListDomainsRequest where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs ListDomainsRequest from required parameters
newListDomainsRequest :: ListDomainsRequest
newListDomainsRequest  = ListDomainsRequest { "MaxNumberOfDomains": (NullOrUndefined Nothing), "NextToken": (NullOrUndefined Nothing) }

-- | Constructs ListDomainsRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newListDomainsRequest' :: ( { "MaxNumberOfDomains" :: NullOrUndefined.NullOrUndefined (Int) , "NextToken" :: NullOrUndefined.NullOrUndefined (String) } -> {"MaxNumberOfDomains" :: NullOrUndefined.NullOrUndefined (Int) , "NextToken" :: NullOrUndefined.NullOrUndefined (String) } ) -> ListDomainsRequest
newListDomainsRequest'  customize = (ListDomainsRequest <<< customize) { "MaxNumberOfDomains": (NullOrUndefined Nothing), "NextToken": (NullOrUndefined Nothing) }



newtype ListDomainsResult = ListDomainsResult 
  { "DomainNames" :: NullOrUndefined.NullOrUndefined (DomainNameList)
  , "NextToken" :: NullOrUndefined.NullOrUndefined (String)
  }
derive instance newtypeListDomainsResult :: Newtype ListDomainsResult _
derive instance repGenericListDomainsResult :: Generic ListDomainsResult _
instance showListDomainsResult :: Show ListDomainsResult where
  show = genericShow
instance decodeListDomainsResult :: Decode ListDomainsResult where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeListDomainsResult :: Encode ListDomainsResult where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs ListDomainsResult from required parameters
newListDomainsResult :: ListDomainsResult
newListDomainsResult  = ListDomainsResult { "DomainNames": (NullOrUndefined Nothing), "NextToken": (NullOrUndefined Nothing) }

-- | Constructs ListDomainsResult's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newListDomainsResult' :: ( { "DomainNames" :: NullOrUndefined.NullOrUndefined (DomainNameList) , "NextToken" :: NullOrUndefined.NullOrUndefined (String) } -> {"DomainNames" :: NullOrUndefined.NullOrUndefined (DomainNameList) , "NextToken" :: NullOrUndefined.NullOrUndefined (String) } ) -> ListDomainsResult
newListDomainsResult'  customize = (ListDomainsResult <<< customize) { "DomainNames": (NullOrUndefined Nothing), "NextToken": (NullOrUndefined Nothing) }



-- | <p>The request must contain the specified missing parameter.</p>
newtype MissingParameter = MissingParameter 
  { "BoxUsage" :: NullOrUndefined.NullOrUndefined (Number)
  }
derive instance newtypeMissingParameter :: Newtype MissingParameter _
derive instance repGenericMissingParameter :: Generic MissingParameter _
instance showMissingParameter :: Show MissingParameter where
  show = genericShow
instance decodeMissingParameter :: Decode MissingParameter where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeMissingParameter :: Encode MissingParameter where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs MissingParameter from required parameters
newMissingParameter :: MissingParameter
newMissingParameter  = MissingParameter { "BoxUsage": (NullOrUndefined Nothing) }

-- | Constructs MissingParameter's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newMissingParameter' :: ( { "BoxUsage" :: NullOrUndefined.NullOrUndefined (Number) } -> {"BoxUsage" :: NullOrUndefined.NullOrUndefined (Number) } ) -> MissingParameter
newMissingParameter'  customize = (MissingParameter <<< customize) { "BoxUsage": (NullOrUndefined Nothing) }



-- | <p>The specified domain does not exist.</p>
newtype NoSuchDomain = NoSuchDomain 
  { "BoxUsage" :: NullOrUndefined.NullOrUndefined (Number)
  }
derive instance newtypeNoSuchDomain :: Newtype NoSuchDomain _
derive instance repGenericNoSuchDomain :: Generic NoSuchDomain _
instance showNoSuchDomain :: Show NoSuchDomain where
  show = genericShow
instance decodeNoSuchDomain :: Decode NoSuchDomain where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeNoSuchDomain :: Encode NoSuchDomain where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs NoSuchDomain from required parameters
newNoSuchDomain :: NoSuchDomain
newNoSuchDomain  = NoSuchDomain { "BoxUsage": (NullOrUndefined Nothing) }

-- | Constructs NoSuchDomain's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newNoSuchDomain' :: ( { "BoxUsage" :: NullOrUndefined.NullOrUndefined (Number) } -> {"BoxUsage" :: NullOrUndefined.NullOrUndefined (Number) } ) -> NoSuchDomain
newNoSuchDomain'  customize = (NoSuchDomain <<< customize) { "BoxUsage": (NullOrUndefined Nothing) }



-- | <p>Too many attributes in this domain.</p>
newtype NumberDomainAttributesExceeded = NumberDomainAttributesExceeded 
  { "BoxUsage" :: NullOrUndefined.NullOrUndefined (Number)
  }
derive instance newtypeNumberDomainAttributesExceeded :: Newtype NumberDomainAttributesExceeded _
derive instance repGenericNumberDomainAttributesExceeded :: Generic NumberDomainAttributesExceeded _
instance showNumberDomainAttributesExceeded :: Show NumberDomainAttributesExceeded where
  show = genericShow
instance decodeNumberDomainAttributesExceeded :: Decode NumberDomainAttributesExceeded where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeNumberDomainAttributesExceeded :: Encode NumberDomainAttributesExceeded where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs NumberDomainAttributesExceeded from required parameters
newNumberDomainAttributesExceeded :: NumberDomainAttributesExceeded
newNumberDomainAttributesExceeded  = NumberDomainAttributesExceeded { "BoxUsage": (NullOrUndefined Nothing) }

-- | Constructs NumberDomainAttributesExceeded's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newNumberDomainAttributesExceeded' :: ( { "BoxUsage" :: NullOrUndefined.NullOrUndefined (Number) } -> {"BoxUsage" :: NullOrUndefined.NullOrUndefined (Number) } ) -> NumberDomainAttributesExceeded
newNumberDomainAttributesExceeded'  customize = (NumberDomainAttributesExceeded <<< customize) { "BoxUsage": (NullOrUndefined Nothing) }



-- | <p>Too many bytes in this domain.</p>
newtype NumberDomainBytesExceeded = NumberDomainBytesExceeded 
  { "BoxUsage" :: NullOrUndefined.NullOrUndefined (Number)
  }
derive instance newtypeNumberDomainBytesExceeded :: Newtype NumberDomainBytesExceeded _
derive instance repGenericNumberDomainBytesExceeded :: Generic NumberDomainBytesExceeded _
instance showNumberDomainBytesExceeded :: Show NumberDomainBytesExceeded where
  show = genericShow
instance decodeNumberDomainBytesExceeded :: Decode NumberDomainBytesExceeded where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeNumberDomainBytesExceeded :: Encode NumberDomainBytesExceeded where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs NumberDomainBytesExceeded from required parameters
newNumberDomainBytesExceeded :: NumberDomainBytesExceeded
newNumberDomainBytesExceeded  = NumberDomainBytesExceeded { "BoxUsage": (NullOrUndefined Nothing) }

-- | Constructs NumberDomainBytesExceeded's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newNumberDomainBytesExceeded' :: ( { "BoxUsage" :: NullOrUndefined.NullOrUndefined (Number) } -> {"BoxUsage" :: NullOrUndefined.NullOrUndefined (Number) } ) -> NumberDomainBytesExceeded
newNumberDomainBytesExceeded'  customize = (NumberDomainBytesExceeded <<< customize) { "BoxUsage": (NullOrUndefined Nothing) }



-- | <p>Too many domains exist per this account.</p>
newtype NumberDomainsExceeded = NumberDomainsExceeded 
  { "BoxUsage" :: NullOrUndefined.NullOrUndefined (Number)
  }
derive instance newtypeNumberDomainsExceeded :: Newtype NumberDomainsExceeded _
derive instance repGenericNumberDomainsExceeded :: Generic NumberDomainsExceeded _
instance showNumberDomainsExceeded :: Show NumberDomainsExceeded where
  show = genericShow
instance decodeNumberDomainsExceeded :: Decode NumberDomainsExceeded where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeNumberDomainsExceeded :: Encode NumberDomainsExceeded where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs NumberDomainsExceeded from required parameters
newNumberDomainsExceeded :: NumberDomainsExceeded
newNumberDomainsExceeded  = NumberDomainsExceeded { "BoxUsage": (NullOrUndefined Nothing) }

-- | Constructs NumberDomainsExceeded's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newNumberDomainsExceeded' :: ( { "BoxUsage" :: NullOrUndefined.NullOrUndefined (Number) } -> {"BoxUsage" :: NullOrUndefined.NullOrUndefined (Number) } ) -> NumberDomainsExceeded
newNumberDomainsExceeded'  customize = (NumberDomainsExceeded <<< customize) { "BoxUsage": (NullOrUndefined Nothing) }



-- | <p>Too many attributes in this item.</p>
newtype NumberItemAttributesExceeded = NumberItemAttributesExceeded 
  { "BoxUsage" :: NullOrUndefined.NullOrUndefined (Number)
  }
derive instance newtypeNumberItemAttributesExceeded :: Newtype NumberItemAttributesExceeded _
derive instance repGenericNumberItemAttributesExceeded :: Generic NumberItemAttributesExceeded _
instance showNumberItemAttributesExceeded :: Show NumberItemAttributesExceeded where
  show = genericShow
instance decodeNumberItemAttributesExceeded :: Decode NumberItemAttributesExceeded where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeNumberItemAttributesExceeded :: Encode NumberItemAttributesExceeded where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs NumberItemAttributesExceeded from required parameters
newNumberItemAttributesExceeded :: NumberItemAttributesExceeded
newNumberItemAttributesExceeded  = NumberItemAttributesExceeded { "BoxUsage": (NullOrUndefined Nothing) }

-- | Constructs NumberItemAttributesExceeded's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newNumberItemAttributesExceeded' :: ( { "BoxUsage" :: NullOrUndefined.NullOrUndefined (Number) } -> {"BoxUsage" :: NullOrUndefined.NullOrUndefined (Number) } ) -> NumberItemAttributesExceeded
newNumberItemAttributesExceeded'  customize = (NumberItemAttributesExceeded <<< customize) { "BoxUsage": (NullOrUndefined Nothing) }



-- | <p>Too many attributes exist in a single call.</p>
newtype NumberSubmittedAttributesExceeded = NumberSubmittedAttributesExceeded 
  { "BoxUsage" :: NullOrUndefined.NullOrUndefined (Number)
  }
derive instance newtypeNumberSubmittedAttributesExceeded :: Newtype NumberSubmittedAttributesExceeded _
derive instance repGenericNumberSubmittedAttributesExceeded :: Generic NumberSubmittedAttributesExceeded _
instance showNumberSubmittedAttributesExceeded :: Show NumberSubmittedAttributesExceeded where
  show = genericShow
instance decodeNumberSubmittedAttributesExceeded :: Decode NumberSubmittedAttributesExceeded where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeNumberSubmittedAttributesExceeded :: Encode NumberSubmittedAttributesExceeded where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs NumberSubmittedAttributesExceeded from required parameters
newNumberSubmittedAttributesExceeded :: NumberSubmittedAttributesExceeded
newNumberSubmittedAttributesExceeded  = NumberSubmittedAttributesExceeded { "BoxUsage": (NullOrUndefined Nothing) }

-- | Constructs NumberSubmittedAttributesExceeded's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newNumberSubmittedAttributesExceeded' :: ( { "BoxUsage" :: NullOrUndefined.NullOrUndefined (Number) } -> {"BoxUsage" :: NullOrUndefined.NullOrUndefined (Number) } ) -> NumberSubmittedAttributesExceeded
newNumberSubmittedAttributesExceeded'  customize = (NumberSubmittedAttributesExceeded <<< customize) { "BoxUsage": (NullOrUndefined Nothing) }



-- | <p>Too many items exist in a single call.</p>
newtype NumberSubmittedItemsExceeded = NumberSubmittedItemsExceeded 
  { "BoxUsage" :: NullOrUndefined.NullOrUndefined (Number)
  }
derive instance newtypeNumberSubmittedItemsExceeded :: Newtype NumberSubmittedItemsExceeded _
derive instance repGenericNumberSubmittedItemsExceeded :: Generic NumberSubmittedItemsExceeded _
instance showNumberSubmittedItemsExceeded :: Show NumberSubmittedItemsExceeded where
  show = genericShow
instance decodeNumberSubmittedItemsExceeded :: Decode NumberSubmittedItemsExceeded where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeNumberSubmittedItemsExceeded :: Encode NumberSubmittedItemsExceeded where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs NumberSubmittedItemsExceeded from required parameters
newNumberSubmittedItemsExceeded :: NumberSubmittedItemsExceeded
newNumberSubmittedItemsExceeded  = NumberSubmittedItemsExceeded { "BoxUsage": (NullOrUndefined Nothing) }

-- | Constructs NumberSubmittedItemsExceeded's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newNumberSubmittedItemsExceeded' :: ( { "BoxUsage" :: NullOrUndefined.NullOrUndefined (Number) } -> {"BoxUsage" :: NullOrUndefined.NullOrUndefined (Number) } ) -> NumberSubmittedItemsExceeded
newNumberSubmittedItemsExceeded'  customize = (NumberSubmittedItemsExceeded <<< customize) { "BoxUsage": (NullOrUndefined Nothing) }



newtype PutAttributesRequest = PutAttributesRequest 
  { "DomainName" :: (String)
  , "ItemName" :: (String)
  , "Attributes" :: (ReplaceableAttributeList)
  , "Expected" :: NullOrUndefined.NullOrUndefined (UpdateCondition)
  }
derive instance newtypePutAttributesRequest :: Newtype PutAttributesRequest _
derive instance repGenericPutAttributesRequest :: Generic PutAttributesRequest _
instance showPutAttributesRequest :: Show PutAttributesRequest where
  show = genericShow
instance decodePutAttributesRequest :: Decode PutAttributesRequest where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodePutAttributesRequest :: Encode PutAttributesRequest where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs PutAttributesRequest from required parameters
newPutAttributesRequest :: ReplaceableAttributeList -> String -> String -> PutAttributesRequest
newPutAttributesRequest _Attributes _DomainName _ItemName = PutAttributesRequest { "Attributes": _Attributes, "DomainName": _DomainName, "ItemName": _ItemName, "Expected": (NullOrUndefined Nothing) }

-- | Constructs PutAttributesRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newPutAttributesRequest' :: ReplaceableAttributeList -> String -> String -> ( { "DomainName" :: (String) , "ItemName" :: (String) , "Attributes" :: (ReplaceableAttributeList) , "Expected" :: NullOrUndefined.NullOrUndefined (UpdateCondition) } -> {"DomainName" :: (String) , "ItemName" :: (String) , "Attributes" :: (ReplaceableAttributeList) , "Expected" :: NullOrUndefined.NullOrUndefined (UpdateCondition) } ) -> PutAttributesRequest
newPutAttributesRequest' _Attributes _DomainName _ItemName customize = (PutAttributesRequest <<< customize) { "Attributes": _Attributes, "DomainName": _DomainName, "ItemName": _ItemName, "Expected": (NullOrUndefined Nothing) }



-- | <p></p>
newtype ReplaceableAttribute = ReplaceableAttribute 
  { "Name" :: (String)
  , "Value" :: (String)
  , "Replace" :: NullOrUndefined.NullOrUndefined (Boolean)
  }
derive instance newtypeReplaceableAttribute :: Newtype ReplaceableAttribute _
derive instance repGenericReplaceableAttribute :: Generic ReplaceableAttribute _
instance showReplaceableAttribute :: Show ReplaceableAttribute where
  show = genericShow
instance decodeReplaceableAttribute :: Decode ReplaceableAttribute where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeReplaceableAttribute :: Encode ReplaceableAttribute where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs ReplaceableAttribute from required parameters
newReplaceableAttribute :: String -> String -> ReplaceableAttribute
newReplaceableAttribute _Name _Value = ReplaceableAttribute { "Name": _Name, "Value": _Value, "Replace": (NullOrUndefined Nothing) }

-- | Constructs ReplaceableAttribute's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newReplaceableAttribute' :: String -> String -> ( { "Name" :: (String) , "Value" :: (String) , "Replace" :: NullOrUndefined.NullOrUndefined (Boolean) } -> {"Name" :: (String) , "Value" :: (String) , "Replace" :: NullOrUndefined.NullOrUndefined (Boolean) } ) -> ReplaceableAttribute
newReplaceableAttribute' _Name _Value customize = (ReplaceableAttribute <<< customize) { "Name": _Name, "Value": _Value, "Replace": (NullOrUndefined Nothing) }



newtype ReplaceableAttributeList = ReplaceableAttributeList (Array ReplaceableAttribute)
derive instance newtypeReplaceableAttributeList :: Newtype ReplaceableAttributeList _
derive instance repGenericReplaceableAttributeList :: Generic ReplaceableAttributeList _
instance showReplaceableAttributeList :: Show ReplaceableAttributeList where
  show = genericShow
instance decodeReplaceableAttributeList :: Decode ReplaceableAttributeList where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeReplaceableAttributeList :: Encode ReplaceableAttributeList where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p></p>
newtype ReplaceableItem = ReplaceableItem 
  { "Name" :: (String)
  , "Attributes" :: (ReplaceableAttributeList)
  }
derive instance newtypeReplaceableItem :: Newtype ReplaceableItem _
derive instance repGenericReplaceableItem :: Generic ReplaceableItem _
instance showReplaceableItem :: Show ReplaceableItem where
  show = genericShow
instance decodeReplaceableItem :: Decode ReplaceableItem where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeReplaceableItem :: Encode ReplaceableItem where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

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
instance showReplaceableItemList :: Show ReplaceableItemList where
  show = genericShow
instance decodeReplaceableItemList :: Decode ReplaceableItemList where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeReplaceableItemList :: Encode ReplaceableItemList where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p>A timeout occurred when attempting to query the specified domain with specified query expression.</p>
newtype RequestTimeout = RequestTimeout 
  { "BoxUsage" :: NullOrUndefined.NullOrUndefined (Number)
  }
derive instance newtypeRequestTimeout :: Newtype RequestTimeout _
derive instance repGenericRequestTimeout :: Generic RequestTimeout _
instance showRequestTimeout :: Show RequestTimeout where
  show = genericShow
instance decodeRequestTimeout :: Decode RequestTimeout where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeRequestTimeout :: Encode RequestTimeout where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs RequestTimeout from required parameters
newRequestTimeout :: RequestTimeout
newRequestTimeout  = RequestTimeout { "BoxUsage": (NullOrUndefined Nothing) }

-- | Constructs RequestTimeout's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newRequestTimeout' :: ( { "BoxUsage" :: NullOrUndefined.NullOrUndefined (Number) } -> {"BoxUsage" :: NullOrUndefined.NullOrUndefined (Number) } ) -> RequestTimeout
newRequestTimeout'  customize = (RequestTimeout <<< customize) { "BoxUsage": (NullOrUndefined Nothing) }



newtype SelectRequest = SelectRequest 
  { "SelectExpression" :: (String)
  , "NextToken" :: NullOrUndefined.NullOrUndefined (String)
  , "ConsistentRead" :: NullOrUndefined.NullOrUndefined (Boolean)
  }
derive instance newtypeSelectRequest :: Newtype SelectRequest _
derive instance repGenericSelectRequest :: Generic SelectRequest _
instance showSelectRequest :: Show SelectRequest where
  show = genericShow
instance decodeSelectRequest :: Decode SelectRequest where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeSelectRequest :: Encode SelectRequest where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs SelectRequest from required parameters
newSelectRequest :: String -> SelectRequest
newSelectRequest _SelectExpression = SelectRequest { "SelectExpression": _SelectExpression, "ConsistentRead": (NullOrUndefined Nothing), "NextToken": (NullOrUndefined Nothing) }

-- | Constructs SelectRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newSelectRequest' :: String -> ( { "SelectExpression" :: (String) , "NextToken" :: NullOrUndefined.NullOrUndefined (String) , "ConsistentRead" :: NullOrUndefined.NullOrUndefined (Boolean) } -> {"SelectExpression" :: (String) , "NextToken" :: NullOrUndefined.NullOrUndefined (String) , "ConsistentRead" :: NullOrUndefined.NullOrUndefined (Boolean) } ) -> SelectRequest
newSelectRequest' _SelectExpression customize = (SelectRequest <<< customize) { "SelectExpression": _SelectExpression, "ConsistentRead": (NullOrUndefined Nothing), "NextToken": (NullOrUndefined Nothing) }



newtype SelectResult = SelectResult 
  { "Items" :: NullOrUndefined.NullOrUndefined (ItemList)
  , "NextToken" :: NullOrUndefined.NullOrUndefined (String)
  }
derive instance newtypeSelectResult :: Newtype SelectResult _
derive instance repGenericSelectResult :: Generic SelectResult _
instance showSelectResult :: Show SelectResult where
  show = genericShow
instance decodeSelectResult :: Decode SelectResult where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeSelectResult :: Encode SelectResult where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs SelectResult from required parameters
newSelectResult :: SelectResult
newSelectResult  = SelectResult { "Items": (NullOrUndefined Nothing), "NextToken": (NullOrUndefined Nothing) }

-- | Constructs SelectResult's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newSelectResult' :: ( { "Items" :: NullOrUndefined.NullOrUndefined (ItemList) , "NextToken" :: NullOrUndefined.NullOrUndefined (String) } -> {"Items" :: NullOrUndefined.NullOrUndefined (ItemList) , "NextToken" :: NullOrUndefined.NullOrUndefined (String) } ) -> SelectResult
newSelectResult'  customize = (SelectResult <<< customize) { "Items": (NullOrUndefined Nothing), "NextToken": (NullOrUndefined Nothing) }



-- | <p>Too many attributes requested.</p>
newtype TooManyRequestedAttributes = TooManyRequestedAttributes 
  { "BoxUsage" :: NullOrUndefined.NullOrUndefined (Number)
  }
derive instance newtypeTooManyRequestedAttributes :: Newtype TooManyRequestedAttributes _
derive instance repGenericTooManyRequestedAttributes :: Generic TooManyRequestedAttributes _
instance showTooManyRequestedAttributes :: Show TooManyRequestedAttributes where
  show = genericShow
instance decodeTooManyRequestedAttributes :: Decode TooManyRequestedAttributes where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeTooManyRequestedAttributes :: Encode TooManyRequestedAttributes where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs TooManyRequestedAttributes from required parameters
newTooManyRequestedAttributes :: TooManyRequestedAttributes
newTooManyRequestedAttributes  = TooManyRequestedAttributes { "BoxUsage": (NullOrUndefined Nothing) }

-- | Constructs TooManyRequestedAttributes's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newTooManyRequestedAttributes' :: ( { "BoxUsage" :: NullOrUndefined.NullOrUndefined (Number) } -> {"BoxUsage" :: NullOrUndefined.NullOrUndefined (Number) } ) -> TooManyRequestedAttributes
newTooManyRequestedAttributes'  customize = (TooManyRequestedAttributes <<< customize) { "BoxUsage": (NullOrUndefined Nothing) }



-- | <p> Specifies the conditions under which data should be updated. If an update condition is specified for a request, the data will only be updated if the condition is satisfied. For example, if an attribute with a specific name and value exists, or if a specific attribute doesn't exist. </p>
newtype UpdateCondition = UpdateCondition 
  { "Name" :: NullOrUndefined.NullOrUndefined (String)
  , "Value" :: NullOrUndefined.NullOrUndefined (String)
  , "Exists" :: NullOrUndefined.NullOrUndefined (Boolean)
  }
derive instance newtypeUpdateCondition :: Newtype UpdateCondition _
derive instance repGenericUpdateCondition :: Generic UpdateCondition _
instance showUpdateCondition :: Show UpdateCondition where
  show = genericShow
instance decodeUpdateCondition :: Decode UpdateCondition where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeUpdateCondition :: Encode UpdateCondition where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs UpdateCondition from required parameters
newUpdateCondition :: UpdateCondition
newUpdateCondition  = UpdateCondition { "Exists": (NullOrUndefined Nothing), "Name": (NullOrUndefined Nothing), "Value": (NullOrUndefined Nothing) }

-- | Constructs UpdateCondition's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newUpdateCondition' :: ( { "Name" :: NullOrUndefined.NullOrUndefined (String) , "Value" :: NullOrUndefined.NullOrUndefined (String) , "Exists" :: NullOrUndefined.NullOrUndefined (Boolean) } -> {"Name" :: NullOrUndefined.NullOrUndefined (String) , "Value" :: NullOrUndefined.NullOrUndefined (String) , "Exists" :: NullOrUndefined.NullOrUndefined (Boolean) } ) -> UpdateCondition
newUpdateCondition'  customize = (UpdateCondition <<< customize) { "Exists": (NullOrUndefined Nothing), "Name": (NullOrUndefined Nothing), "Value": (NullOrUndefined Nothing) }

