@implementation VFXUSKData_helper

+ (id)dataWithToken:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;

  v4 = objc_alloc((Class)qword_1EEF66A88);
  return (id)objc_msgSend_initWithToken_(v4, v5, (uint64_t)a3, v6);
}

+ (id)dataWithInt:(int)a3
{
  uint64_t v3;
  id v4;
  const char *v5;
  uint64_t v6;

  v3 = *(_QWORD *)&a3;
  v4 = objc_alloc((Class)qword_1EEF66A88);
  return (id)objc_msgSend_initWithInt_(v4, v5, v3, v6);
}

+ (id)dataWithDouble:(double)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = objc_alloc((Class)qword_1EEF66A88);
  return (id)objc_msgSend_initWithDouble_(v4, v5, v6, v7, a3);
}

+ (id)dataWithString:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;

  v4 = objc_alloc((Class)qword_1EEF66A88);
  return (id)objc_msgSend_initWithString_(v4, v5, (uint64_t)a3, v6);
}

@end
