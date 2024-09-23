@implementation MCSMessageOperation

- (BOOL)commitToMessages:(id)a3 failures:(id)a4 newMessages:(id)a5
{
  id v9;
  id v10;
  id v11;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[MCSMessageOperation doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MCSMessageOperation commitToMessages:failures:newMessages:]", "MCSMessageOperation.m", 17, "0");
}

- (BOOL)willMarkRead
{
  -[MCSMessageOperation doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MCSMessageOperation willMarkRead]", "MCSMessageOperation.m", 21, "0");
}

- (BOOL)willMarkUnread
{
  -[MCSMessageOperation doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MCSMessageOperation willMarkUnread]", "MCSMessageOperation.m", 25, "0");
}

- (BOOL)willFlag
{
  -[MCSMessageOperation doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MCSMessageOperation willFlag]", "MCSMessageOperation.m", 29, "0");
}

- (BOOL)willUnflag
{
  -[MCSMessageOperation doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MCSMessageOperation willUnflag]", "MCSMessageOperation.m", 33, "0");
}

- (id)localizedErrorDescriptionForMessageCount:(unint64_t)a3
{
  -[MCSMessageOperation doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MCSMessageOperation localizedErrorDescriptionForMessageCount:]", "MCSMessageOperation.m", 37, "0");
}

- (id)localizedErrorTitleForMessageCount:(unint64_t)a3
{
  -[MCSMessageOperation doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MCSMessageOperation localizedErrorTitleForMessageCount:]", "MCSMessageOperation.m", 41, "0");
}

- (id)localizedShortOperationDescription
{
  -[MCSMessageOperation doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MCSMessageOperation localizedShortOperationDescription]", "MCSMessageOperation.m", 45, "0");
}

@end
