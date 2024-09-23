@implementation DOCUIPBrowserState

- (BOOL)tabIsSpecified
{
  return -[DOCUIPBrowserState contentMode](self, "contentMode") != (id)-1;
}

- (unint64_t)tab
{
  DOCUIPBrowserState *v2;
  id v3;
  unint64_t v4;
  unint64_t result;
  id v6;
  uint64_t v7;
  id v8;

  v2 = self;
  v3 = -[DOCUIPBrowserState contentMode](v2, "contentMode");
  if ((unint64_t)v3 + 1 >= 4)
  {
    v6 = v3;
    type metadata accessor for DOCUIPBrowserContentMode(0);
    v8 = v6;
    result = _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)(v7, &v8, v7, &type metadata for Int);
    __break(1u);
  }
  else
  {
    v4 = qword_1004DDD38[(_QWORD)v3 + 1];

    return v4;
  }
  return result;
}

- (void)setTab:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  DOCUIPBrowserState *v7;
  unint64_t v8;

  if (a3 >= 3)
  {
    type metadata accessor for DOCTab(0);
    v6 = v5;
    v8 = a3;
    v7 = self;
    _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)(v6, &v8, v6, &type metadata for UInt);
    __break(1u);
  }
  else
  {
    -[DOCUIPBrowserState setContentMode:](self, "setContentMode:");
  }
}

@end
