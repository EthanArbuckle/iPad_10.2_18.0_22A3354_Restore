@implementation VCSerializedEventInfo

id __VCSerializedEventInfo_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "UUIDString");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v4 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v2, "absoluteString");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)v3;
LABEL_7:

  return v4;
}

@end
