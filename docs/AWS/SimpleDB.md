## Module AWS.SimpleDB

Amazon SimpleDB is a web service providing the core database functions of data indexing and querying in the cloud. By offloading the time and effort associated with building and operating a web-scale database, SimpleDB provides developers the freedom to focus on application development. <p> A traditional, clustered relational database requires a sizable upfront capital outlay, is complex to design, and often requires extensive and repetitive database administration. Amazon SimpleDB is dramatically simpler, requiring no schema, automatically indexing your data and providing a simple API for storage and access. This approach eliminates the administrative burden of data modeling, index maintenance, and performance tuning. Developers gain access to this functionality within Amazon's proven computing environment, are able to scale instantly, and pay only for what they use. </p> <p> Visit <a href="http://aws.amazon.com/simpledb/">http://aws.amazon.com/simpledb/</a> for more information. </p>

#### `batchDeleteAttributes`

``` purescript
batchDeleteAttributes :: forall eff. BatchDeleteAttributesRequest -> Aff (exception :: EXCEPTION | eff) NoOutput
```

<p> Performs multiple DeleteAttributes operations in a single call, which reduces round trips and latencies. This enables Amazon SimpleDB to optimize requests, which generally yields better throughput. </p> <note> <p> If you specify BatchDeleteAttributes without attributes or values, all the attributes for the item are deleted. </p> <p> BatchDeleteAttributes is an idempotent operation; running it multiple times on the same item or attribute doesn't result in an error. </p> <p> The BatchDeleteAttributes operation succeeds or fails in its entirety. There are no partial deletes. You can execute multiple BatchDeleteAttributes operations and other operations in parallel. However, large numbers of concurrent BatchDeleteAttributes calls can result in Service Unavailable (503) responses. </p> <p> This operation is vulnerable to exceeding the maximum URL size when making a REST request using the HTTP GET method. </p> <p> This operation does not support conditions using Expected.X.Name, Expected.X.Value, or Expected.X.Exists. </p> </note> <p> The following limitations are enforced for this operation: <ul> <li>1 MB request size</li> <li>25 item limit per BatchDeleteAttributes operation</li> </ul> </p>

#### `batchPutAttributes`

``` purescript
batchPutAttributes :: forall eff. BatchPutAttributesRequest -> Aff (exception :: EXCEPTION | eff) NoOutput
```

<p> The <code>BatchPutAttributes</code> operation creates or replaces attributes within one or more items. By using this operation, the client can perform multiple <a>PutAttribute</a> operation with a single call. This helps yield savings in round trips and latencies, enabling Amazon SimpleDB to optimize requests and generally produce better throughput. </p> <p> The client may specify the item name with the <code>Item.X.ItemName</code> parameter. The client may specify new attributes using a combination of the <code>Item.X.Attribute.Y.Name</code> and <code>Item.X.Attribute.Y.Value</code> parameters. The client may specify the first attribute for the first item using the parameters <code>Item.0.Attribute.0.Name</code> and <code>Item.0.Attribute.0.Value</code>, and for the second attribute for the first item by the parameters <code>Item.0.Attribute.1.Name</code> and <code>Item.0.Attribute.1.Value</code>, and so on. </p> <p> Attributes are uniquely identified within an item by their name/value combination. For example, a single item can have the attributes <code>{ "first_name", "first_value" }</code> and <code>{ "first_name", "second_value" }</code>. However, it cannot have two attribute instances where both the <code>Item.X.Attribute.Y.Name</code> and <code>Item.X.Attribute.Y.Value</code> are the same. </p> <p> Optionally, the requester can supply the <code>Replace</code> parameter for each individual value. Setting this value to <code>true</code> will cause the new attribute values to replace the existing attribute values. For example, if an item <code>I</code> has the attributes <code>{ 'a', '1' }, { 'b', '2'}</code> and <code>{ 'b', '3' }</code> and the requester does a BatchPutAttributes of <code>{'I', 'b', '4' }</code> with the Replace parameter set to true, the final attributes of the item will be <code>{ 'a', '1' }</code> and <code>{ 'b', '4' }</code>, replacing the previous values of the 'b' attribute with the new value. </p> <note> You cannot specify an empty string as an item or as an attribute name. The <code>BatchPutAttributes</code> operation succeeds or fails in its entirety. There are no partial puts. </note> <important> This operation is vulnerable to exceeding the maximum URL size when making a REST request using the HTTP GET method. This operation does not support conditions using <code>Expected.X.Name</code>, <code>Expected.X.Value</code>, or <code>Expected.X.Exists</code>. </important> <p> You can execute multiple <code>BatchPutAttributes</code> operations and other operations in parallel. However, large numbers of concurrent <code>BatchPutAttributes</code> calls can result in Service Unavailable (503) responses. </p> <p> The following limitations are enforced for this operation: <ul> <li>256 attribute name-value pairs per item</li> <li>1 MB request size</li> <li>1 billion attributes per domain</li> <li>10 GB of total user data storage per domain</li> <li>25 item limit per <code>BatchPutAttributes</code> operation</li> </ul> </p>

#### `createDomain`

``` purescript
createDomain :: forall eff. CreateDomainRequest -> Aff (exception :: EXCEPTION | eff) NoOutput
```

<p> The <code>CreateDomain</code> operation creates a new domain. The domain name should be unique among the domains associated with the Access Key ID provided in the request. The <code>CreateDomain</code> operation may take 10 or more seconds to complete. </p> <note> CreateDomain is an idempotent operation; running it multiple times using the same domain name will not result in an error response. </note> <p> The client can create up to 100 domains per account. </p> <p> If the client requires additional domains, go to <a href="http://aws.amazon.com/contact-us/simpledb-limit-request/"> http://aws.amazon.com/contact-us/simpledb-limit-request/</a>. </p>

#### `deleteAttributes`

``` purescript
deleteAttributes :: forall eff. DeleteAttributesRequest -> Aff (exception :: EXCEPTION | eff) NoOutput
```

<p> Deletes one or more attributes associated with an item. If all attributes of the item are deleted, the item is deleted. </p> <note> If <code>DeleteAttributes</code> is called without being passed any attributes or values specified, all the attributes for the item are deleted. </note> <p> <code>DeleteAttributes</code> is an idempotent operation; running it multiple times on the same item or attribute does not result in an error response. </p> <p> Because Amazon SimpleDB makes multiple copies of item data and uses an eventual consistency update model, performing a <a>GetAttributes</a> or <a>Select</a> operation (read) immediately after a <code>DeleteAttributes</code> or <a>PutAttributes</a> operation (write) might not return updated item data. </p>

#### `deleteDomain`

``` purescript
deleteDomain :: forall eff. DeleteDomainRequest -> Aff (exception :: EXCEPTION | eff) NoOutput
```

<p> The <code>DeleteDomain</code> operation deletes a domain. Any items (and their attributes) in the domain are deleted as well. The <code>DeleteDomain</code> operation might take 10 or more seconds to complete. </p> <note> Running <code>DeleteDomain</code> on a domain that does not exist or running the function multiple times using the same domain name will not result in an error response. </note>

#### `domainMetadata`

``` purescript
domainMetadata :: forall eff. DomainMetadataRequest -> Aff (exception :: EXCEPTION | eff) DomainMetadataResult
```

<p> Returns information about the domain, including when the domain was created, the number of items and attributes in the domain, and the size of the attribute names and values. </p>

#### `getAttributes`

``` purescript
getAttributes :: forall eff. GetAttributesRequest -> Aff (exception :: EXCEPTION | eff) GetAttributesResult
```

<p> Returns all of the attributes associated with the specified item. Optionally, the attributes returned can be limited to one or more attributes by specifying an attribute name parameter. </p> <p> If the item does not exist on the replica that was accessed for this operation, an empty set is returned. The system does not return an error as it cannot guarantee the item does not exist on other replicas. </p> <note> If GetAttributes is called without being passed any attribute names, all the attributes for the item are returned. </note>

#### `listDomains`

``` purescript
listDomains :: forall eff. ListDomainsRequest -> Aff (exception :: EXCEPTION | eff) ListDomainsResult
```

<p> The <code>ListDomains</code> operation lists all domains associated with the Access Key ID. It returns domain names up to the limit set by <a href="#MaxNumberOfDomains">MaxNumberOfDomains</a>. A <a href="#NextToken">NextToken</a> is returned if there are more than <code>MaxNumberOfDomains</code> domains. Calling <code>ListDomains</code> successive times with the <code>NextToken</code> provided by the operation returns up to <code>MaxNumberOfDomains</code> more domain names with each successive operation call. </p>

#### `putAttributes`

``` purescript
putAttributes :: forall eff. PutAttributesRequest -> Aff (exception :: EXCEPTION | eff) NoOutput
```

<p> The PutAttributes operation creates or replaces attributes in an item. The client may specify new attributes using a combination of the <code>Attribute.X.Name</code> and <code>Attribute.X.Value</code> parameters. The client specifies the first attribute by the parameters <code>Attribute.0.Name</code> and <code>Attribute.0.Value</code>, the second attribute by the parameters <code>Attribute.1.Name</code> and <code>Attribute.1.Value</code>, and so on. </p> <p> Attributes are uniquely identified in an item by their name/value combination. For example, a single item can have the attributes <code>{ "first_name", "first_value" }</code> and <code>{ "first_name", second_value" }</code>. However, it cannot have two attribute instances where both the <code>Attribute.X.Name</code> and <code>Attribute.X.Value</code> are the same. </p> <p> Optionally, the requestor can supply the <code>Replace</code> parameter for each individual attribute. Setting this value to <code>true</code> causes the new attribute value to replace the existing attribute value(s). For example, if an item has the attributes <code>{ 'a', '1' }</code>, <code>{ 'b', '2'}</code> and <code>{ 'b', '3' }</code> and the requestor calls <code>PutAttributes</code> using the attributes <code>{ 'b', '4' }</code> with the <code>Replace</code> parameter set to true, the final attributes of the item are changed to <code>{ 'a', '1' }</code> and <code>{ 'b', '4' }</code>, which replaces the previous values of the 'b' attribute with the new value. </p> <note> Using <code>PutAttributes</code> to replace attribute values that do not exist will not result in an error response. </note> <p> You cannot specify an empty string as an attribute name. </p> <p> Because Amazon SimpleDB makes multiple copies of client data and uses an eventual consistency update model, an immediate <a>GetAttributes</a> or <a>Select</a> operation (read) immediately after a <a>PutAttributes</a> or <a>DeleteAttributes</a> operation (write) might not return the updated data. </p> <p> The following limitations are enforced for this operation: <ul> <li>256 total attribute name-value pairs per item</li> <li>One billion attributes per domain</li> <li>10 GB of total user data storage per domain</li> </ul> </p>

#### `select`

``` purescript
select :: forall eff. SelectRequest -> Aff (exception :: EXCEPTION | eff) SelectResult
```

<p> The <code>Select</code> operation returns a set of attributes for <code>ItemNames</code> that match the select expression. <code>Select</code> is similar to the standard SQL SELECT statement. </p> <p> The total size of the response cannot exceed 1 MB in total size. Amazon SimpleDB automatically adjusts the number of items returned per page to enforce this limit. For example, if the client asks to retrieve 2500 items, but each individual item is 10 kB in size, the system returns 100 items and an appropriate <code>NextToken</code> so the client can access the next page of results. </p> <p> For information on how to construct select expressions, see Using Select to Create Amazon SimpleDB Queries in the Developer Guide. </p>

#### `Attribute`

``` purescript
newtype Attribute
  = Attribute { "Name" :: String, "AlternateNameEncoding" :: NullOrUndefined (String), "Value" :: String, "AlternateValueEncoding" :: NullOrUndefined (String) }
```

<p></p>

##### Instances
``` purescript
Newtype Attribute _
Generic Attribute _
Show Attribute
Decode Attribute
Encode Attribute
```

#### `newAttribute`

``` purescript
newAttribute :: String -> String -> Attribute
```

Constructs Attribute from required parameters

#### `newAttribute'`

``` purescript
newAttribute' :: String -> String -> ({ "Name" :: String, "AlternateNameEncoding" :: NullOrUndefined (String), "Value" :: String, "AlternateValueEncoding" :: NullOrUndefined (String) } -> { "Name" :: String, "AlternateNameEncoding" :: NullOrUndefined (String), "Value" :: String, "AlternateValueEncoding" :: NullOrUndefined (String) }) -> Attribute
```

Constructs Attribute's fields from required parameters

#### `AttributeDoesNotExist`

``` purescript
newtype AttributeDoesNotExist
  = AttributeDoesNotExist { "BoxUsage" :: NullOrUndefined (Number) }
```

<p>The specified attribute does not exist.</p>

##### Instances
``` purescript
Newtype AttributeDoesNotExist _
Generic AttributeDoesNotExist _
Show AttributeDoesNotExist
Decode AttributeDoesNotExist
Encode AttributeDoesNotExist
```

#### `newAttributeDoesNotExist`

``` purescript
newAttributeDoesNotExist :: AttributeDoesNotExist
```

Constructs AttributeDoesNotExist from required parameters

#### `newAttributeDoesNotExist'`

``` purescript
newAttributeDoesNotExist' :: ({ "BoxUsage" :: NullOrUndefined (Number) } -> { "BoxUsage" :: NullOrUndefined (Number) }) -> AttributeDoesNotExist
```

Constructs AttributeDoesNotExist's fields from required parameters

#### `AttributeList`

``` purescript
newtype AttributeList
  = AttributeList (Array Attribute)
```

##### Instances
``` purescript
Newtype AttributeList _
Generic AttributeList _
Show AttributeList
Decode AttributeList
Encode AttributeList
```

#### `AttributeNameList`

``` purescript
newtype AttributeNameList
  = AttributeNameList (Array String)
```

##### Instances
``` purescript
Newtype AttributeNameList _
Generic AttributeNameList _
Show AttributeNameList
Decode AttributeNameList
Encode AttributeNameList
```

#### `BatchDeleteAttributesRequest`

``` purescript
newtype BatchDeleteAttributesRequest
  = BatchDeleteAttributesRequest { "DomainName" :: String, "Items" :: DeletableItemList }
```

##### Instances
``` purescript
Newtype BatchDeleteAttributesRequest _
Generic BatchDeleteAttributesRequest _
Show BatchDeleteAttributesRequest
Decode BatchDeleteAttributesRequest
Encode BatchDeleteAttributesRequest
```

#### `newBatchDeleteAttributesRequest`

``` purescript
newBatchDeleteAttributesRequest :: String -> DeletableItemList -> BatchDeleteAttributesRequest
```

Constructs BatchDeleteAttributesRequest from required parameters

#### `newBatchDeleteAttributesRequest'`

``` purescript
newBatchDeleteAttributesRequest' :: String -> DeletableItemList -> ({ "DomainName" :: String, "Items" :: DeletableItemList } -> { "DomainName" :: String, "Items" :: DeletableItemList }) -> BatchDeleteAttributesRequest
```

Constructs BatchDeleteAttributesRequest's fields from required parameters

#### `BatchPutAttributesRequest`

``` purescript
newtype BatchPutAttributesRequest
  = BatchPutAttributesRequest { "DomainName" :: String, "Items" :: ReplaceableItemList }
```

##### Instances
``` purescript
Newtype BatchPutAttributesRequest _
Generic BatchPutAttributesRequest _
Show BatchPutAttributesRequest
Decode BatchPutAttributesRequest
Encode BatchPutAttributesRequest
```

#### `newBatchPutAttributesRequest`

``` purescript
newBatchPutAttributesRequest :: String -> ReplaceableItemList -> BatchPutAttributesRequest
```

Constructs BatchPutAttributesRequest from required parameters

#### `newBatchPutAttributesRequest'`

``` purescript
newBatchPutAttributesRequest' :: String -> ReplaceableItemList -> ({ "DomainName" :: String, "Items" :: ReplaceableItemList } -> { "DomainName" :: String, "Items" :: ReplaceableItemList }) -> BatchPutAttributesRequest
```

Constructs BatchPutAttributesRequest's fields from required parameters

#### `CreateDomainRequest`

``` purescript
newtype CreateDomainRequest
  = CreateDomainRequest { "DomainName" :: String }
```

##### Instances
``` purescript
Newtype CreateDomainRequest _
Generic CreateDomainRequest _
Show CreateDomainRequest
Decode CreateDomainRequest
Encode CreateDomainRequest
```

#### `newCreateDomainRequest`

``` purescript
newCreateDomainRequest :: String -> CreateDomainRequest
```

Constructs CreateDomainRequest from required parameters

#### `newCreateDomainRequest'`

``` purescript
newCreateDomainRequest' :: String -> ({ "DomainName" :: String } -> { "DomainName" :: String }) -> CreateDomainRequest
```

Constructs CreateDomainRequest's fields from required parameters

#### `DeletableAttribute`

``` purescript
newtype DeletableAttribute
  = DeletableAttribute { "Name" :: String, "Value" :: NullOrUndefined (String) }
```

<p></p>

##### Instances
``` purescript
Newtype DeletableAttribute _
Generic DeletableAttribute _
Show DeletableAttribute
Decode DeletableAttribute
Encode DeletableAttribute
```

#### `newDeletableAttribute`

``` purescript
newDeletableAttribute :: String -> DeletableAttribute
```

Constructs DeletableAttribute from required parameters

#### `newDeletableAttribute'`

``` purescript
newDeletableAttribute' :: String -> ({ "Name" :: String, "Value" :: NullOrUndefined (String) } -> { "Name" :: String, "Value" :: NullOrUndefined (String) }) -> DeletableAttribute
```

Constructs DeletableAttribute's fields from required parameters

#### `DeletableAttributeList`

``` purescript
newtype DeletableAttributeList
  = DeletableAttributeList (Array DeletableAttribute)
```

##### Instances
``` purescript
Newtype DeletableAttributeList _
Generic DeletableAttributeList _
Show DeletableAttributeList
Decode DeletableAttributeList
Encode DeletableAttributeList
```

#### `DeletableItem`

``` purescript
newtype DeletableItem
  = DeletableItem { "Name" :: String, "Attributes" :: NullOrUndefined (DeletableAttributeList) }
```

##### Instances
``` purescript
Newtype DeletableItem _
Generic DeletableItem _
Show DeletableItem
Decode DeletableItem
Encode DeletableItem
```

#### `newDeletableItem`

``` purescript
newDeletableItem :: String -> DeletableItem
```

Constructs DeletableItem from required parameters

#### `newDeletableItem'`

``` purescript
newDeletableItem' :: String -> ({ "Name" :: String, "Attributes" :: NullOrUndefined (DeletableAttributeList) } -> { "Name" :: String, "Attributes" :: NullOrUndefined (DeletableAttributeList) }) -> DeletableItem
```

Constructs DeletableItem's fields from required parameters

#### `DeletableItemList`

``` purescript
newtype DeletableItemList
  = DeletableItemList (Array DeletableItem)
```

##### Instances
``` purescript
Newtype DeletableItemList _
Generic DeletableItemList _
Show DeletableItemList
Decode DeletableItemList
Encode DeletableItemList
```

#### `DeleteAttributesRequest`

``` purescript
newtype DeleteAttributesRequest
  = DeleteAttributesRequest { "DomainName" :: String, "ItemName" :: String, "Attributes" :: NullOrUndefined (DeletableAttributeList), "Expected" :: NullOrUndefined (UpdateCondition) }
```

##### Instances
``` purescript
Newtype DeleteAttributesRequest _
Generic DeleteAttributesRequest _
Show DeleteAttributesRequest
Decode DeleteAttributesRequest
Encode DeleteAttributesRequest
```

#### `newDeleteAttributesRequest`

``` purescript
newDeleteAttributesRequest :: String -> String -> DeleteAttributesRequest
```

Constructs DeleteAttributesRequest from required parameters

#### `newDeleteAttributesRequest'`

``` purescript
newDeleteAttributesRequest' :: String -> String -> ({ "DomainName" :: String, "ItemName" :: String, "Attributes" :: NullOrUndefined (DeletableAttributeList), "Expected" :: NullOrUndefined (UpdateCondition) } -> { "DomainName" :: String, "ItemName" :: String, "Attributes" :: NullOrUndefined (DeletableAttributeList), "Expected" :: NullOrUndefined (UpdateCondition) }) -> DeleteAttributesRequest
```

Constructs DeleteAttributesRequest's fields from required parameters

#### `DeleteDomainRequest`

``` purescript
newtype DeleteDomainRequest
  = DeleteDomainRequest { "DomainName" :: String }
```

##### Instances
``` purescript
Newtype DeleteDomainRequest _
Generic DeleteDomainRequest _
Show DeleteDomainRequest
Decode DeleteDomainRequest
Encode DeleteDomainRequest
```

#### `newDeleteDomainRequest`

``` purescript
newDeleteDomainRequest :: String -> DeleteDomainRequest
```

Constructs DeleteDomainRequest from required parameters

#### `newDeleteDomainRequest'`

``` purescript
newDeleteDomainRequest' :: String -> ({ "DomainName" :: String } -> { "DomainName" :: String }) -> DeleteDomainRequest
```

Constructs DeleteDomainRequest's fields from required parameters

#### `DomainMetadataRequest`

``` purescript
newtype DomainMetadataRequest
  = DomainMetadataRequest { "DomainName" :: String }
```

##### Instances
``` purescript
Newtype DomainMetadataRequest _
Generic DomainMetadataRequest _
Show DomainMetadataRequest
Decode DomainMetadataRequest
Encode DomainMetadataRequest
```

#### `newDomainMetadataRequest`

``` purescript
newDomainMetadataRequest :: String -> DomainMetadataRequest
```

Constructs DomainMetadataRequest from required parameters

#### `newDomainMetadataRequest'`

``` purescript
newDomainMetadataRequest' :: String -> ({ "DomainName" :: String } -> { "DomainName" :: String }) -> DomainMetadataRequest
```

Constructs DomainMetadataRequest's fields from required parameters

#### `DomainMetadataResult`

``` purescript
newtype DomainMetadataResult
  = DomainMetadataResult { "ItemCount" :: NullOrUndefined (Int), "ItemNamesSizeBytes" :: NullOrUndefined (Number), "AttributeNameCount" :: NullOrUndefined (Int), "AttributeNamesSizeBytes" :: NullOrUndefined (Number), "AttributeValueCount" :: NullOrUndefined (Int), "AttributeValuesSizeBytes" :: NullOrUndefined (Number), "Timestamp" :: NullOrUndefined (Int) }
```

##### Instances
``` purescript
Newtype DomainMetadataResult _
Generic DomainMetadataResult _
Show DomainMetadataResult
Decode DomainMetadataResult
Encode DomainMetadataResult
```

#### `newDomainMetadataResult`

``` purescript
newDomainMetadataResult :: DomainMetadataResult
```

Constructs DomainMetadataResult from required parameters

#### `newDomainMetadataResult'`

``` purescript
newDomainMetadataResult' :: ({ "ItemCount" :: NullOrUndefined (Int), "ItemNamesSizeBytes" :: NullOrUndefined (Number), "AttributeNameCount" :: NullOrUndefined (Int), "AttributeNamesSizeBytes" :: NullOrUndefined (Number), "AttributeValueCount" :: NullOrUndefined (Int), "AttributeValuesSizeBytes" :: NullOrUndefined (Number), "Timestamp" :: NullOrUndefined (Int) } -> { "ItemCount" :: NullOrUndefined (Int), "ItemNamesSizeBytes" :: NullOrUndefined (Number), "AttributeNameCount" :: NullOrUndefined (Int), "AttributeNamesSizeBytes" :: NullOrUndefined (Number), "AttributeValueCount" :: NullOrUndefined (Int), "AttributeValuesSizeBytes" :: NullOrUndefined (Number), "Timestamp" :: NullOrUndefined (Int) }) -> DomainMetadataResult
```

Constructs DomainMetadataResult's fields from required parameters

#### `DomainNameList`

``` purescript
newtype DomainNameList
  = DomainNameList (Array String)
```

##### Instances
``` purescript
Newtype DomainNameList _
Generic DomainNameList _
Show DomainNameList
Decode DomainNameList
Encode DomainNameList
```

#### `DuplicateItemName`

``` purescript
newtype DuplicateItemName
  = DuplicateItemName { "BoxUsage" :: NullOrUndefined (Number) }
```

<p>The item name was specified more than once. </p>

##### Instances
``` purescript
Newtype DuplicateItemName _
Generic DuplicateItemName _
Show DuplicateItemName
Decode DuplicateItemName
Encode DuplicateItemName
```

#### `newDuplicateItemName`

``` purescript
newDuplicateItemName :: DuplicateItemName
```

Constructs DuplicateItemName from required parameters

#### `newDuplicateItemName'`

``` purescript
newDuplicateItemName' :: ({ "BoxUsage" :: NullOrUndefined (Number) } -> { "BoxUsage" :: NullOrUndefined (Number) }) -> DuplicateItemName
```

Constructs DuplicateItemName's fields from required parameters

#### `GetAttributesRequest`

``` purescript
newtype GetAttributesRequest
  = GetAttributesRequest { "DomainName" :: String, "ItemName" :: String, "AttributeNames" :: NullOrUndefined (AttributeNameList), "ConsistentRead" :: NullOrUndefined (Boolean) }
```

##### Instances
``` purescript
Newtype GetAttributesRequest _
Generic GetAttributesRequest _
Show GetAttributesRequest
Decode GetAttributesRequest
Encode GetAttributesRequest
```

#### `newGetAttributesRequest`

``` purescript
newGetAttributesRequest :: String -> String -> GetAttributesRequest
```

Constructs GetAttributesRequest from required parameters

#### `newGetAttributesRequest'`

``` purescript
newGetAttributesRequest' :: String -> String -> ({ "DomainName" :: String, "ItemName" :: String, "AttributeNames" :: NullOrUndefined (AttributeNameList), "ConsistentRead" :: NullOrUndefined (Boolean) } -> { "DomainName" :: String, "ItemName" :: String, "AttributeNames" :: NullOrUndefined (AttributeNameList), "ConsistentRead" :: NullOrUndefined (Boolean) }) -> GetAttributesRequest
```

Constructs GetAttributesRequest's fields from required parameters

#### `GetAttributesResult`

``` purescript
newtype GetAttributesResult
  = GetAttributesResult { "Attributes" :: NullOrUndefined (AttributeList) }
```

##### Instances
``` purescript
Newtype GetAttributesResult _
Generic GetAttributesResult _
Show GetAttributesResult
Decode GetAttributesResult
Encode GetAttributesResult
```

#### `newGetAttributesResult`

``` purescript
newGetAttributesResult :: GetAttributesResult
```

Constructs GetAttributesResult from required parameters

#### `newGetAttributesResult'`

``` purescript
newGetAttributesResult' :: ({ "Attributes" :: NullOrUndefined (AttributeList) } -> { "Attributes" :: NullOrUndefined (AttributeList) }) -> GetAttributesResult
```

Constructs GetAttributesResult's fields from required parameters

#### `InvalidNextToken`

``` purescript
newtype InvalidNextToken
  = InvalidNextToken { "BoxUsage" :: NullOrUndefined (Number) }
```

<p>The specified NextToken is not valid. </p>

##### Instances
``` purescript
Newtype InvalidNextToken _
Generic InvalidNextToken _
Show InvalidNextToken
Decode InvalidNextToken
Encode InvalidNextToken
```

#### `newInvalidNextToken`

``` purescript
newInvalidNextToken :: InvalidNextToken
```

Constructs InvalidNextToken from required parameters

#### `newInvalidNextToken'`

``` purescript
newInvalidNextToken' :: ({ "BoxUsage" :: NullOrUndefined (Number) } -> { "BoxUsage" :: NullOrUndefined (Number) }) -> InvalidNextToken
```

Constructs InvalidNextToken's fields from required parameters

#### `InvalidNumberPredicates`

``` purescript
newtype InvalidNumberPredicates
  = InvalidNumberPredicates { "BoxUsage" :: NullOrUndefined (Number) }
```

<p>Too many predicates exist in the query expression.</p>

##### Instances
``` purescript
Newtype InvalidNumberPredicates _
Generic InvalidNumberPredicates _
Show InvalidNumberPredicates
Decode InvalidNumberPredicates
Encode InvalidNumberPredicates
```

#### `newInvalidNumberPredicates`

``` purescript
newInvalidNumberPredicates :: InvalidNumberPredicates
```

Constructs InvalidNumberPredicates from required parameters

#### `newInvalidNumberPredicates'`

``` purescript
newInvalidNumberPredicates' :: ({ "BoxUsage" :: NullOrUndefined (Number) } -> { "BoxUsage" :: NullOrUndefined (Number) }) -> InvalidNumberPredicates
```

Constructs InvalidNumberPredicates's fields from required parameters

#### `InvalidNumberValueTests`

``` purescript
newtype InvalidNumberValueTests
  = InvalidNumberValueTests { "BoxUsage" :: NullOrUndefined (Number) }
```

<p>Too many predicates exist in the query expression.</p>

##### Instances
``` purescript
Newtype InvalidNumberValueTests _
Generic InvalidNumberValueTests _
Show InvalidNumberValueTests
Decode InvalidNumberValueTests
Encode InvalidNumberValueTests
```

#### `newInvalidNumberValueTests`

``` purescript
newInvalidNumberValueTests :: InvalidNumberValueTests
```

Constructs InvalidNumberValueTests from required parameters

#### `newInvalidNumberValueTests'`

``` purescript
newInvalidNumberValueTests' :: ({ "BoxUsage" :: NullOrUndefined (Number) } -> { "BoxUsage" :: NullOrUndefined (Number) }) -> InvalidNumberValueTests
```

Constructs InvalidNumberValueTests's fields from required parameters

#### `InvalidParameterValue`

``` purescript
newtype InvalidParameterValue
  = InvalidParameterValue { "BoxUsage" :: NullOrUndefined (Number) }
```

<p>The value for a parameter is invalid.</p>

##### Instances
``` purescript
Newtype InvalidParameterValue _
Generic InvalidParameterValue _
Show InvalidParameterValue
Decode InvalidParameterValue
Encode InvalidParameterValue
```

#### `newInvalidParameterValue`

``` purescript
newInvalidParameterValue :: InvalidParameterValue
```

Constructs InvalidParameterValue from required parameters

#### `newInvalidParameterValue'`

``` purescript
newInvalidParameterValue' :: ({ "BoxUsage" :: NullOrUndefined (Number) } -> { "BoxUsage" :: NullOrUndefined (Number) }) -> InvalidParameterValue
```

Constructs InvalidParameterValue's fields from required parameters

#### `InvalidQueryExpression`

``` purescript
newtype InvalidQueryExpression
  = InvalidQueryExpression { "BoxUsage" :: NullOrUndefined (Number) }
```

<p>The specified query expression syntax is not valid.</p>

##### Instances
``` purescript
Newtype InvalidQueryExpression _
Generic InvalidQueryExpression _
Show InvalidQueryExpression
Decode InvalidQueryExpression
Encode InvalidQueryExpression
```

#### `newInvalidQueryExpression`

``` purescript
newInvalidQueryExpression :: InvalidQueryExpression
```

Constructs InvalidQueryExpression from required parameters

#### `newInvalidQueryExpression'`

``` purescript
newInvalidQueryExpression' :: ({ "BoxUsage" :: NullOrUndefined (Number) } -> { "BoxUsage" :: NullOrUndefined (Number) }) -> InvalidQueryExpression
```

Constructs InvalidQueryExpression's fields from required parameters

#### `Item`

``` purescript
newtype Item
  = Item { "Name" :: String, "AlternateNameEncoding" :: NullOrUndefined (String), "Attributes" :: AttributeList }
```

<p></p>

##### Instances
``` purescript
Newtype Item _
Generic Item _
Show Item
Decode Item
Encode Item
```

#### `newItem`

``` purescript
newItem :: AttributeList -> String -> Item
```

Constructs Item from required parameters

#### `newItem'`

``` purescript
newItem' :: AttributeList -> String -> ({ "Name" :: String, "AlternateNameEncoding" :: NullOrUndefined (String), "Attributes" :: AttributeList } -> { "Name" :: String, "AlternateNameEncoding" :: NullOrUndefined (String), "Attributes" :: AttributeList }) -> Item
```

Constructs Item's fields from required parameters

#### `ItemList`

``` purescript
newtype ItemList
  = ItemList (Array Item)
```

##### Instances
``` purescript
Newtype ItemList _
Generic ItemList _
Show ItemList
Decode ItemList
Encode ItemList
```

#### `ListDomainsRequest`

``` purescript
newtype ListDomainsRequest
  = ListDomainsRequest { "MaxNumberOfDomains" :: NullOrUndefined (Int), "NextToken" :: NullOrUndefined (String) }
```

##### Instances
``` purescript
Newtype ListDomainsRequest _
Generic ListDomainsRequest _
Show ListDomainsRequest
Decode ListDomainsRequest
Encode ListDomainsRequest
```

#### `newListDomainsRequest`

``` purescript
newListDomainsRequest :: ListDomainsRequest
```

Constructs ListDomainsRequest from required parameters

#### `newListDomainsRequest'`

``` purescript
newListDomainsRequest' :: ({ "MaxNumberOfDomains" :: NullOrUndefined (Int), "NextToken" :: NullOrUndefined (String) } -> { "MaxNumberOfDomains" :: NullOrUndefined (Int), "NextToken" :: NullOrUndefined (String) }) -> ListDomainsRequest
```

Constructs ListDomainsRequest's fields from required parameters

#### `ListDomainsResult`

``` purescript
newtype ListDomainsResult
  = ListDomainsResult { "DomainNames" :: NullOrUndefined (DomainNameList), "NextToken" :: NullOrUndefined (String) }
```

##### Instances
``` purescript
Newtype ListDomainsResult _
Generic ListDomainsResult _
Show ListDomainsResult
Decode ListDomainsResult
Encode ListDomainsResult
```

#### `newListDomainsResult`

``` purescript
newListDomainsResult :: ListDomainsResult
```

Constructs ListDomainsResult from required parameters

#### `newListDomainsResult'`

``` purescript
newListDomainsResult' :: ({ "DomainNames" :: NullOrUndefined (DomainNameList), "NextToken" :: NullOrUndefined (String) } -> { "DomainNames" :: NullOrUndefined (DomainNameList), "NextToken" :: NullOrUndefined (String) }) -> ListDomainsResult
```

Constructs ListDomainsResult's fields from required parameters

#### `MissingParameter`

``` purescript
newtype MissingParameter
  = MissingParameter { "BoxUsage" :: NullOrUndefined (Number) }
```

<p>The request must contain the specified missing parameter.</p>

##### Instances
``` purescript
Newtype MissingParameter _
Generic MissingParameter _
Show MissingParameter
Decode MissingParameter
Encode MissingParameter
```

#### `newMissingParameter`

``` purescript
newMissingParameter :: MissingParameter
```

Constructs MissingParameter from required parameters

#### `newMissingParameter'`

``` purescript
newMissingParameter' :: ({ "BoxUsage" :: NullOrUndefined (Number) } -> { "BoxUsage" :: NullOrUndefined (Number) }) -> MissingParameter
```

Constructs MissingParameter's fields from required parameters

#### `NoSuchDomain`

``` purescript
newtype NoSuchDomain
  = NoSuchDomain { "BoxUsage" :: NullOrUndefined (Number) }
```

<p>The specified domain does not exist.</p>

##### Instances
``` purescript
Newtype NoSuchDomain _
Generic NoSuchDomain _
Show NoSuchDomain
Decode NoSuchDomain
Encode NoSuchDomain
```

#### `newNoSuchDomain`

``` purescript
newNoSuchDomain :: NoSuchDomain
```

Constructs NoSuchDomain from required parameters

#### `newNoSuchDomain'`

``` purescript
newNoSuchDomain' :: ({ "BoxUsage" :: NullOrUndefined (Number) } -> { "BoxUsage" :: NullOrUndefined (Number) }) -> NoSuchDomain
```

Constructs NoSuchDomain's fields from required parameters

#### `NumberDomainAttributesExceeded`

``` purescript
newtype NumberDomainAttributesExceeded
  = NumberDomainAttributesExceeded { "BoxUsage" :: NullOrUndefined (Number) }
```

<p>Too many attributes in this domain.</p>

##### Instances
``` purescript
Newtype NumberDomainAttributesExceeded _
Generic NumberDomainAttributesExceeded _
Show NumberDomainAttributesExceeded
Decode NumberDomainAttributesExceeded
Encode NumberDomainAttributesExceeded
```

#### `newNumberDomainAttributesExceeded`

``` purescript
newNumberDomainAttributesExceeded :: NumberDomainAttributesExceeded
```

Constructs NumberDomainAttributesExceeded from required parameters

#### `newNumberDomainAttributesExceeded'`

``` purescript
newNumberDomainAttributesExceeded' :: ({ "BoxUsage" :: NullOrUndefined (Number) } -> { "BoxUsage" :: NullOrUndefined (Number) }) -> NumberDomainAttributesExceeded
```

Constructs NumberDomainAttributesExceeded's fields from required parameters

#### `NumberDomainBytesExceeded`

``` purescript
newtype NumberDomainBytesExceeded
  = NumberDomainBytesExceeded { "BoxUsage" :: NullOrUndefined (Number) }
```

<p>Too many bytes in this domain.</p>

##### Instances
``` purescript
Newtype NumberDomainBytesExceeded _
Generic NumberDomainBytesExceeded _
Show NumberDomainBytesExceeded
Decode NumberDomainBytesExceeded
Encode NumberDomainBytesExceeded
```

#### `newNumberDomainBytesExceeded`

``` purescript
newNumberDomainBytesExceeded :: NumberDomainBytesExceeded
```

Constructs NumberDomainBytesExceeded from required parameters

#### `newNumberDomainBytesExceeded'`

``` purescript
newNumberDomainBytesExceeded' :: ({ "BoxUsage" :: NullOrUndefined (Number) } -> { "BoxUsage" :: NullOrUndefined (Number) }) -> NumberDomainBytesExceeded
```

Constructs NumberDomainBytesExceeded's fields from required parameters

#### `NumberDomainsExceeded`

``` purescript
newtype NumberDomainsExceeded
  = NumberDomainsExceeded { "BoxUsage" :: NullOrUndefined (Number) }
```

<p>Too many domains exist per this account.</p>

##### Instances
``` purescript
Newtype NumberDomainsExceeded _
Generic NumberDomainsExceeded _
Show NumberDomainsExceeded
Decode NumberDomainsExceeded
Encode NumberDomainsExceeded
```

#### `newNumberDomainsExceeded`

``` purescript
newNumberDomainsExceeded :: NumberDomainsExceeded
```

Constructs NumberDomainsExceeded from required parameters

#### `newNumberDomainsExceeded'`

``` purescript
newNumberDomainsExceeded' :: ({ "BoxUsage" :: NullOrUndefined (Number) } -> { "BoxUsage" :: NullOrUndefined (Number) }) -> NumberDomainsExceeded
```

Constructs NumberDomainsExceeded's fields from required parameters

#### `NumberItemAttributesExceeded`

``` purescript
newtype NumberItemAttributesExceeded
  = NumberItemAttributesExceeded { "BoxUsage" :: NullOrUndefined (Number) }
```

<p>Too many attributes in this item.</p>

##### Instances
``` purescript
Newtype NumberItemAttributesExceeded _
Generic NumberItemAttributesExceeded _
Show NumberItemAttributesExceeded
Decode NumberItemAttributesExceeded
Encode NumberItemAttributesExceeded
```

#### `newNumberItemAttributesExceeded`

``` purescript
newNumberItemAttributesExceeded :: NumberItemAttributesExceeded
```

Constructs NumberItemAttributesExceeded from required parameters

#### `newNumberItemAttributesExceeded'`

``` purescript
newNumberItemAttributesExceeded' :: ({ "BoxUsage" :: NullOrUndefined (Number) } -> { "BoxUsage" :: NullOrUndefined (Number) }) -> NumberItemAttributesExceeded
```

Constructs NumberItemAttributesExceeded's fields from required parameters

#### `NumberSubmittedAttributesExceeded`

``` purescript
newtype NumberSubmittedAttributesExceeded
  = NumberSubmittedAttributesExceeded { "BoxUsage" :: NullOrUndefined (Number) }
```

<p>Too many attributes exist in a single call.</p>

##### Instances
``` purescript
Newtype NumberSubmittedAttributesExceeded _
Generic NumberSubmittedAttributesExceeded _
Show NumberSubmittedAttributesExceeded
Decode NumberSubmittedAttributesExceeded
Encode NumberSubmittedAttributesExceeded
```

#### `newNumberSubmittedAttributesExceeded`

``` purescript
newNumberSubmittedAttributesExceeded :: NumberSubmittedAttributesExceeded
```

Constructs NumberSubmittedAttributesExceeded from required parameters

#### `newNumberSubmittedAttributesExceeded'`

``` purescript
newNumberSubmittedAttributesExceeded' :: ({ "BoxUsage" :: NullOrUndefined (Number) } -> { "BoxUsage" :: NullOrUndefined (Number) }) -> NumberSubmittedAttributesExceeded
```

Constructs NumberSubmittedAttributesExceeded's fields from required parameters

#### `NumberSubmittedItemsExceeded`

``` purescript
newtype NumberSubmittedItemsExceeded
  = NumberSubmittedItemsExceeded { "BoxUsage" :: NullOrUndefined (Number) }
```

<p>Too many items exist in a single call.</p>

##### Instances
``` purescript
Newtype NumberSubmittedItemsExceeded _
Generic NumberSubmittedItemsExceeded _
Show NumberSubmittedItemsExceeded
Decode NumberSubmittedItemsExceeded
Encode NumberSubmittedItemsExceeded
```

#### `newNumberSubmittedItemsExceeded`

``` purescript
newNumberSubmittedItemsExceeded :: NumberSubmittedItemsExceeded
```

Constructs NumberSubmittedItemsExceeded from required parameters

#### `newNumberSubmittedItemsExceeded'`

``` purescript
newNumberSubmittedItemsExceeded' :: ({ "BoxUsage" :: NullOrUndefined (Number) } -> { "BoxUsage" :: NullOrUndefined (Number) }) -> NumberSubmittedItemsExceeded
```

Constructs NumberSubmittedItemsExceeded's fields from required parameters

#### `PutAttributesRequest`

``` purescript
newtype PutAttributesRequest
  = PutAttributesRequest { "DomainName" :: String, "ItemName" :: String, "Attributes" :: ReplaceableAttributeList, "Expected" :: NullOrUndefined (UpdateCondition) }
```

##### Instances
``` purescript
Newtype PutAttributesRequest _
Generic PutAttributesRequest _
Show PutAttributesRequest
Decode PutAttributesRequest
Encode PutAttributesRequest
```

#### `newPutAttributesRequest`

``` purescript
newPutAttributesRequest :: ReplaceableAttributeList -> String -> String -> PutAttributesRequest
```

Constructs PutAttributesRequest from required parameters

#### `newPutAttributesRequest'`

``` purescript
newPutAttributesRequest' :: ReplaceableAttributeList -> String -> String -> ({ "DomainName" :: String, "ItemName" :: String, "Attributes" :: ReplaceableAttributeList, "Expected" :: NullOrUndefined (UpdateCondition) } -> { "DomainName" :: String, "ItemName" :: String, "Attributes" :: ReplaceableAttributeList, "Expected" :: NullOrUndefined (UpdateCondition) }) -> PutAttributesRequest
```

Constructs PutAttributesRequest's fields from required parameters

#### `ReplaceableAttribute`

``` purescript
newtype ReplaceableAttribute
  = ReplaceableAttribute { "Name" :: String, "Value" :: String, "Replace" :: NullOrUndefined (Boolean) }
```

<p></p>

##### Instances
``` purescript
Newtype ReplaceableAttribute _
Generic ReplaceableAttribute _
Show ReplaceableAttribute
Decode ReplaceableAttribute
Encode ReplaceableAttribute
```

#### `newReplaceableAttribute`

``` purescript
newReplaceableAttribute :: String -> String -> ReplaceableAttribute
```

Constructs ReplaceableAttribute from required parameters

#### `newReplaceableAttribute'`

``` purescript
newReplaceableAttribute' :: String -> String -> ({ "Name" :: String, "Value" :: String, "Replace" :: NullOrUndefined (Boolean) } -> { "Name" :: String, "Value" :: String, "Replace" :: NullOrUndefined (Boolean) }) -> ReplaceableAttribute
```

Constructs ReplaceableAttribute's fields from required parameters

#### `ReplaceableAttributeList`

``` purescript
newtype ReplaceableAttributeList
  = ReplaceableAttributeList (Array ReplaceableAttribute)
```

##### Instances
``` purescript
Newtype ReplaceableAttributeList _
Generic ReplaceableAttributeList _
Show ReplaceableAttributeList
Decode ReplaceableAttributeList
Encode ReplaceableAttributeList
```

#### `ReplaceableItem`

``` purescript
newtype ReplaceableItem
  = ReplaceableItem { "Name" :: String, "Attributes" :: ReplaceableAttributeList }
```

<p></p>

##### Instances
``` purescript
Newtype ReplaceableItem _
Generic ReplaceableItem _
Show ReplaceableItem
Decode ReplaceableItem
Encode ReplaceableItem
```

#### `newReplaceableItem`

``` purescript
newReplaceableItem :: ReplaceableAttributeList -> String -> ReplaceableItem
```

Constructs ReplaceableItem from required parameters

#### `newReplaceableItem'`

``` purescript
newReplaceableItem' :: ReplaceableAttributeList -> String -> ({ "Name" :: String, "Attributes" :: ReplaceableAttributeList } -> { "Name" :: String, "Attributes" :: ReplaceableAttributeList }) -> ReplaceableItem
```

Constructs ReplaceableItem's fields from required parameters

#### `ReplaceableItemList`

``` purescript
newtype ReplaceableItemList
  = ReplaceableItemList (Array ReplaceableItem)
```

##### Instances
``` purescript
Newtype ReplaceableItemList _
Generic ReplaceableItemList _
Show ReplaceableItemList
Decode ReplaceableItemList
Encode ReplaceableItemList
```

#### `RequestTimeout`

``` purescript
newtype RequestTimeout
  = RequestTimeout { "BoxUsage" :: NullOrUndefined (Number) }
```

<p>A timeout occurred when attempting to query the specified domain with specified query expression.</p>

##### Instances
``` purescript
Newtype RequestTimeout _
Generic RequestTimeout _
Show RequestTimeout
Decode RequestTimeout
Encode RequestTimeout
```

#### `newRequestTimeout`

``` purescript
newRequestTimeout :: RequestTimeout
```

Constructs RequestTimeout from required parameters

#### `newRequestTimeout'`

``` purescript
newRequestTimeout' :: ({ "BoxUsage" :: NullOrUndefined (Number) } -> { "BoxUsage" :: NullOrUndefined (Number) }) -> RequestTimeout
```

Constructs RequestTimeout's fields from required parameters

#### `SelectRequest`

``` purescript
newtype SelectRequest
  = SelectRequest { "SelectExpression" :: String, "NextToken" :: NullOrUndefined (String), "ConsistentRead" :: NullOrUndefined (Boolean) }
```

##### Instances
``` purescript
Newtype SelectRequest _
Generic SelectRequest _
Show SelectRequest
Decode SelectRequest
Encode SelectRequest
```

#### `newSelectRequest`

``` purescript
newSelectRequest :: String -> SelectRequest
```

Constructs SelectRequest from required parameters

#### `newSelectRequest'`

``` purescript
newSelectRequest' :: String -> ({ "SelectExpression" :: String, "NextToken" :: NullOrUndefined (String), "ConsistentRead" :: NullOrUndefined (Boolean) } -> { "SelectExpression" :: String, "NextToken" :: NullOrUndefined (String), "ConsistentRead" :: NullOrUndefined (Boolean) }) -> SelectRequest
```

Constructs SelectRequest's fields from required parameters

#### `SelectResult`

``` purescript
newtype SelectResult
  = SelectResult { "Items" :: NullOrUndefined (ItemList), "NextToken" :: NullOrUndefined (String) }
```

##### Instances
``` purescript
Newtype SelectResult _
Generic SelectResult _
Show SelectResult
Decode SelectResult
Encode SelectResult
```

#### `newSelectResult`

``` purescript
newSelectResult :: SelectResult
```

Constructs SelectResult from required parameters

#### `newSelectResult'`

``` purescript
newSelectResult' :: ({ "Items" :: NullOrUndefined (ItemList), "NextToken" :: NullOrUndefined (String) } -> { "Items" :: NullOrUndefined (ItemList), "NextToken" :: NullOrUndefined (String) }) -> SelectResult
```

Constructs SelectResult's fields from required parameters

#### `TooManyRequestedAttributes`

``` purescript
newtype TooManyRequestedAttributes
  = TooManyRequestedAttributes { "BoxUsage" :: NullOrUndefined (Number) }
```

<p>Too many attributes requested.</p>

##### Instances
``` purescript
Newtype TooManyRequestedAttributes _
Generic TooManyRequestedAttributes _
Show TooManyRequestedAttributes
Decode TooManyRequestedAttributes
Encode TooManyRequestedAttributes
```

#### `newTooManyRequestedAttributes`

``` purescript
newTooManyRequestedAttributes :: TooManyRequestedAttributes
```

Constructs TooManyRequestedAttributes from required parameters

#### `newTooManyRequestedAttributes'`

``` purescript
newTooManyRequestedAttributes' :: ({ "BoxUsage" :: NullOrUndefined (Number) } -> { "BoxUsage" :: NullOrUndefined (Number) }) -> TooManyRequestedAttributes
```

Constructs TooManyRequestedAttributes's fields from required parameters

#### `UpdateCondition`

``` purescript
newtype UpdateCondition
  = UpdateCondition { "Name" :: NullOrUndefined (String), "Value" :: NullOrUndefined (String), "Exists" :: NullOrUndefined (Boolean) }
```

<p> Specifies the conditions under which data should be updated. If an update condition is specified for a request, the data will only be updated if the condition is satisfied. For example, if an attribute with a specific name and value exists, or if a specific attribute doesn't exist. </p>

##### Instances
``` purescript
Newtype UpdateCondition _
Generic UpdateCondition _
Show UpdateCondition
Decode UpdateCondition
Encode UpdateCondition
```

#### `newUpdateCondition`

``` purescript
newUpdateCondition :: UpdateCondition
```

Constructs UpdateCondition from required parameters

#### `newUpdateCondition'`

``` purescript
newUpdateCondition' :: ({ "Name" :: NullOrUndefined (String), "Value" :: NullOrUndefined (String), "Exists" :: NullOrUndefined (Boolean) } -> { "Name" :: NullOrUndefined (String), "Value" :: NullOrUndefined (String), "Exists" :: NullOrUndefined (Boolean) }) -> UpdateCondition
```

Constructs UpdateCondition's fields from required parameters


