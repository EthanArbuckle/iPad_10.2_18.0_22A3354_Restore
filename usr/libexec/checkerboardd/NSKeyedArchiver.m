@implementation NSKeyedArchiver

+ (void)archiveObject:(id)a3 toXPCObject:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSKeyedArchiver *v9;

  v5 = a4;
  v6 = a3;
  v9 = objc_opt_new(NSKeyedArchiver);
  -[NSKeyedArchiver setRequiresSecureCoding:](v9, "setRequiresSecureCoding:", 1);
  -[NSKeyedArchiver encodeObject:forKey:](v9, "encodeObject:forKey:", v6, NSKeyedArchiveRootObjectKey);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSKeyedArchiver encodedData](v9, "encodedData"));
  xpc_dictionary_set_uint64(v5, "Version", 1uLL);
  xpc_dictionary_set_string(v5, "Magic", "CBCo");
  v8 = objc_retainAutorelease(v7);
  xpc_dictionary_set_data(v5, "Data", objc_msgSend(v8, "bytes"), (size_t)objc_msgSend(v8, "length"));

}

@end
