@implementation CMHealthColdStorageUtils

+ (id)getSystemFieldsFromCKRecord:(id)a3
{
  id v4;

  v4 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 1);
  objc_msgSend(a3, "encodeSystemFieldsWithCoder:", v4);
  objc_msgSend(v4, "finishEncoding");
  return objc_msgSend(v4, "encodedData");
}

@end
