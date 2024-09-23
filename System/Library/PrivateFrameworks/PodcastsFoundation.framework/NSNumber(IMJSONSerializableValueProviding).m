@implementation NSNumber(IMJSONSerializableValueProviding)

- (id)im_jsonSerializableValue
{
  NSObject *v2;
  id v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a1, "isEqualToNumber:", *MEMORY[0x1E0C9B208]) & 1) != 0
    || (objc_msgSend(a1, "isEqualToNumber:", *MEMORY[0x1E0C9B218]) & 1) != 0
    || objc_msgSend(a1, "isEqualToNumber:", *MEMORY[0x1E0C9B210]))
  {
    _IMStoreLogCategoryDefault();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v5 = 138412290;
      v6 = a1;
      _os_log_impl(&dword_1A904E000, v2, OS_LOG_TYPE_ERROR, "NaN, +inf and -inf are not JSON serializable (%@)", (uint8_t *)&v5, 0xCu);
    }

    v3 = 0;
  }
  else
  {
    v3 = a1;
  }
  return v3;
}

@end
