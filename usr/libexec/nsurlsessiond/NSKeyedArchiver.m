@implementation NSKeyedArchiver

+ (id)_nsurlsessionproxy_secureArchivedDataWithRootObject:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 1);
  objc_msgSend(v4, "encodeObject:forKey:", v3, NSKeyedArchiveRootObjectKey);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "encodedData"));

  return v5;
}

@end
