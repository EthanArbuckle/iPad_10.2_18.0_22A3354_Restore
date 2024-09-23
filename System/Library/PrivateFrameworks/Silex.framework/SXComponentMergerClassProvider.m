@implementation SXComponentMergerClassProvider

- (Class)classForObject:(id)a3 specVersion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v9;
  void *v10;

  v5 = a4;
  v6 = a3;
  +[SXJSONObjectComponentSupport shared](SXJSONObjectComponentSupport, "shared");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectValueClassBlock");
  v8 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  v9 = objc_opt_class();
  ((void (**)(_QWORD, id, uint64_t, id))v8)[2](v8, v6, v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v10;
}

@end
