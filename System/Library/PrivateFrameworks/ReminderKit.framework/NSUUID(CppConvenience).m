@implementation NSUUID(CppConvenience)

+ (id)CR_UUIDFromStdString:()CppConvenience
{
  id v4;
  uint64_t *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc(MEMORY[0x1E0CB3A28]);
  if (*((char *)a3 + 23) >= 0)
    v5 = a3;
  else
    v5 = (uint64_t *)*a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithUUIDString:", v6);

  return v7;
}

- (void)CR_toStdString
{
  id v3;

  objc_msgSend(a1, "UUIDString");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(a2, (char *)objc_msgSend(v3, "UTF8String"));

}

@end
