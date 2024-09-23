@implementation CRLWPObjcUserDefaults

+ (_TtC8Freeform21CRLWPObjcUserDefaults)sharedUserDefaults
{
  if (qword_1013DD620 != -1)
    swift_once(&qword_1013DD620, sub_1009A49F0);
  return (_TtC8Freeform21CRLWPObjcUserDefaults *)(id)static CRLWPObjcUserDefaults.shared;
}

- (BOOL)spellCheckingEnabled
{
  uint64_t v2;
  _TtC8Freeform21CRLWPObjcUserDefaults *v3;
  unsigned __int8 v4;
  unsigned __int8 v5;
  int v6;

  v2 = qword_1013DDF20;
  v3 = self;
  if (v2 != -1)
    swift_once(&qword_1013DDF20, sub_100D42CC0);
  sub_1009A4CEC(2);
  v5 = v4;
  v6 = v4;

  return (v6 == 2) | v5 & 1;
}

- (_TtC8Freeform21CRLWPObjcUserDefaults)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  return -[CRLWPObjcUserDefaults init](&v3, "init");
}

@end
