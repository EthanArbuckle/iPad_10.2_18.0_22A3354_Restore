@implementation VFXUSKToken_helper

+ (id)tokenWithString:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;

  v4 = objc_alloc((Class)qword_1EEF66A78);
  return (id)objc_msgSend_initWithString_(v4, v5, (uint64_t)a3, v6);
}

@end
