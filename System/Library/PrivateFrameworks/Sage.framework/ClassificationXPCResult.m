@implementation ClassificationXPCResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC4Sage23ClassificationXPCResult)initWithCoder:(id)a3
{
  return (_TtC4Sage23ClassificationXPCResult *)ClassificationXPCResult.init(coder:)(a3);
}

- (_TtC4Sage23ClassificationXPCResult)init
{
  ClassificationXPCResult.init()();
}

- (void).cxx_destruct
{
  _BYTE v2[144];

  sub_245751A80((char *)self + OBJC_IVAR____TtC4Sage23ClassificationXPCResult_result, v2);
  sub_2457526CC((uint64_t)v2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _DWORD))sub_245752728);
}

@end
