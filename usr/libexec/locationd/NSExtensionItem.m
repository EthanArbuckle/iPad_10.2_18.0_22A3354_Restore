@implementation NSExtensionItem

+ (id)extensionItemForDict:(id)a3 withName:(id)a4 withPayload:(id)a5
{
  id v8;
  id v9;

  v8 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", a3, CFSTR("clientDictionary"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", a4, CFSTR("clientName"));
  if (a5)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", a5, 1, 0), CFSTR("archivedPayload"));
  v9 = objc_alloc_init((Class)NSExtensionItem);
  objc_msgSend(v9, "setUserInfo:", v8);
  return v9;
}

@end
