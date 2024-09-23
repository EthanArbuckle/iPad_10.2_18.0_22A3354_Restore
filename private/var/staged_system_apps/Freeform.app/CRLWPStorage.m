@implementation CRLWPStorage

- (_NSRange)rangeOfNumericalSuffixPrecedingCharIndex:(unint64_t)a3
{
  unsigned int v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  Class v8;
  NSString *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  char *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  Class v17;
  NSString *v18;
  void *v19;
  uint64_t v20;
  Class v21;
  NSString *v22;
  void *v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  unsigned int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  void *v35;

  v4 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", a3);
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101247518);
  v5 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v6 = v5;
    objc_opt_class(self, v7);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    *(_DWORD *)buf = 67110146;
    v27 = v4;
    v28 = 2082;
    v29 = "-[CRLWPStorage(SpellCheck) rangeOfNumericalSuffixPrecedingCharIndex:]";
    v30 = 2082;
    v31 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Spelling/CRLWPStorage+SpellCheck.m";
    v32 = 1024;
    v33 = 14;
    v34 = 2114;
    v35 = v10;
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101247538);
  v11 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v12 = v11;
    v13 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v27 = v4;
    v28 = 2114;
    v29 = v13;
    _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPStorage(SpellCheck) rangeOfNumericalSuffixPrecedingCharIndex:]"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Spelling/CRLWPStorage+SpellCheck.m"));
  objc_opt_class(self, v16);
  v18 = NSStringFromClass(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 14, 0, "Abstract method not overridden by %{public}@", v19);

  objc_opt_class(self, v20);
  v22 = NSStringFromClass(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v23, "-[CRLWPStorage(SpellCheck) rangeOfNumericalSuffixPrecedingCharIndex:]"));
  v25 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v24, 0));

  objc_exception_throw(v25);
}

- (_NSRange)rangeOfNumericalSuffixPrecedingCharIndex:(unint64_t)a3 forLocale:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSUInteger v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  uint64_t *v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  void *v20;
  void *v21;
  char *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  NSUInteger v27;
  void *v28;
  NSUInteger v29;
  NSUInteger v30;
  NSUInteger v31;
  NSUInteger v32;
  _NSRange result;

  v6 = a4;
  if ((unint64_t)objc_msgSend(v6, "length") <= 1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101247558);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E10CB4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101247578);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPStorage(SpellCheck) rangeOfNumericalSuffixPrecedingCharIndex:forLocale:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Spelling/CRLWPStorage+SpellCheck.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 19, 0, "Locale string is too short.");

  }
  v11 = 0x7FFFFFFFFFFFFFFFLL;
  v10 = 0;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101247598);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E10C30();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012475B8);
    v12 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v12);
    v13 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPStorage(SpellCheck) rangeOfNumericalSuffixPrecedingCharIndex:forLocale:]"));
    v14 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Spelling/CRLWPStorage+SpellCheck.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 23, 0, "Invalid charIndex.");
  }
  else
  {
    if (qword_101415228 != -1)
      dispatch_once(&qword_101415228, &stru_1012475D8);
    v15 = &qword_1014151D8;
    if ((objc_msgSend(v6, "hasPrefix:", CFSTR("en")) & 1) == 0)
    {
      if ((objc_msgSend(v6, "hasPrefix:", CFSTR("fr")) & 1) != 0)
      {
        v15 = &qword_1014151E0;
      }
      else if ((objc_msgSend(v6, "hasPrefix:", CFSTR("it")) & 1) != 0
             || (objc_msgSend(v6, "hasPrefix:", CFSTR("gl")) & 1) != 0)
      {
        v15 = &qword_1014151E8;
      }
      else if (objc_msgSend(v6, "hasPrefix:", CFSTR("pt")))
      {
        if (objc_msgSend(v6, "hasSuffix:", CFSTR("BR")))
          v15 = &qword_1014151F8;
        else
          v15 = &qword_1014151F0;
      }
      else if ((objc_msgSend(v6, "hasPrefix:", CFSTR("es")) & 1) != 0)
      {
        v15 = &qword_101415200;
      }
      else if ((objc_msgSend(v6, "hasPrefix:", CFSTR("ca")) & 1) != 0)
      {
        v15 = &qword_101415208;
      }
      else if ((objc_msgSend(v6, "hasPrefix:", CFSTR("el")) & 1) != 0)
      {
        v15 = &qword_101415210;
      }
      else if ((objc_msgSend(v6, "hasPrefix:", CFSTR("nl")) & 1) != 0)
      {
        v15 = &qword_101415218;
      }
      else if (objc_msgSend(v6, "hasPrefix:", CFSTR("uk")))
      {
        v15 = &qword_101415220;
      }
    }
    v13 = (id)*v15;
    v14 = -[CRLWPStorage initFromStorage:withRange:]([_TtC8Freeform12CRLWPStorage alloc], "initFromStorage:withRange:", self, 0, a3);
    v16 = (char *)objc_msgSend(v14, "charIndexMappedFromStorage:", a3);
    v17 = sub_1001B098C(v16, 0, v14);
    if (v17 <= v16)
      v18 = v16;
    else
      v18 = v17;
    if (v17 >= v16)
      v19 = v16;
    else
      v19 = v17;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "substringWithRange:", v19, v18 - v19));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet decimalDigitCharacterSet](NSCharacterSet, "decimalDigitCharacterSet"));
    v22 = (char *)objc_msgSend(v20, "rangeOfCharacterFromSet:options:", v21, 4);

    if (v22 == (char *)0x7FFFFFFFFFFFFFFFLL
      || (v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet letterCharacterSet](NSCharacterSet, "letterCharacterSet")),
          v24 = objc_msgSend(v20, "rangeOfCharacterFromSet:options:range:", v23, 0, 0, v22),
          v23,
          v24 != (id)0x7FFFFFFFFFFFFFFFLL))
    {
      v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "substringFromIndex:", v22));
      v31 = 0;
      v26 = 0x7FFFFFFFFFFFFFFFLL;
      if (objc_msgSend(v13, "containsObject:", v25))
      {
        v26 = (uint64_t)objc_msgSend(v14, "charRangeMappedToStorage:", v16- ((_BYTE *)objc_msgSend(v25, "length")+ ~(unint64_t)(objc_msgSend(v25, "characterAtIndex:", 1) == 46)));
        v31 = v27;
      }
      v11 = 0x7FFFFFFFFFFFFFFFLL;
      if (v26 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v10 = v31;
      }
      else
      {
        if (v22 && objc_msgSend(v20, "characterAtIndex:", v22 - 1) == 49)
        {
          if (qword_101415238 != -1)
            dispatch_once(&qword_101415238, &stru_1012475F8);
          v28 = (void *)qword_101415230;
        }
        else
        {
          if (qword_101415248 != -1)
            dispatch_once(&qword_101415248, &stru_101247618);
          v28 = (void *)qword_101415240;
        }
        if (objc_msgSend(v28, "containsObject:", v25, v31))
        {
          v11 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else
        {
          v10 = v32;
          v11 = v26;
        }
      }

    }
  }

  v29 = v11;
  v30 = v10;
  result.length = v30;
  result.location = v29;
  return result;
}

- (CRLCanvasInfoGeometry)geometry
{
  return (CRLCanvasInfoGeometry *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                          + OBJC_IVAR____TtC8Freeform12CRLWPStorage_geometry));
}

- (void)setGeometry:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform12CRLWPStorage_geometry);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform12CRLWPStorage_geometry) = (Class)a3;
  v3 = a3;

}

- (BOOL)hasMarkedText
{
  return *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform12CRLWPStorage_markedTextRange) != 0;
}

- (NSAttributedString)attributedMarkedText
{
  return (NSAttributedString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)OBJC_IVAR____TtC8Freeform12CRLWPStorage_attributedMarkedText
                                                                       + (_QWORD)self));
}

- (void)setAttributedMarkedText:(id)a3
{
  id v3;
  id v4;

  v4 = *(id *)((char *)OBJC_IVAR____TtC8Freeform12CRLWPStorage_attributedMarkedText + (_QWORD)self);
  *(_QWORD *)((char *)OBJC_IVAR____TtC8Freeform12CRLWPStorage_attributedMarkedText + (_QWORD)self) = a3;
  v3 = a3;

}

- (_TtC8Freeform12CRLTextRange)markedTextRange
{
  return (_TtC8Freeform12CRLTextRange *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                + OBJC_IVAR____TtC8Freeform12CRLWPStorage_markedTextRange));
}

- (void)setMarkedTextRange:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform12CRLWPStorage_markedTextRange);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform12CRLWPStorage_markedTextRange) = (Class)a3;
  v3 = a3;

}

- (_TtC8Freeform12CRLTextRange)selectedMarkedTextRange
{
  return (_TtC8Freeform12CRLTextRange *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                + OBJC_IVAR____TtC8Freeform12CRLWPStorage_selectedMarkedTextRange));
}

- (void)setSelectedMarkedTextRange:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform12CRLWPStorage_selectedMarkedTextRange);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform12CRLWPStorage_selectedMarkedTextRange) = (Class)a3;
  v3 = a3;

}

- (_TtC8Freeform12CRLTextRange)selectedMarkedTextRangeFromOS
{
  return (_TtC8Freeform12CRLTextRange *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                + OBJC_IVAR____TtC8Freeform12CRLWPStorage_selectedMarkedTextRangeFromOS));
}

- (void)setSelectedMarkedTextRangeFromOS:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform12CRLWPStorage_selectedMarkedTextRangeFromOS);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform12CRLWPStorage_selectedMarkedTextRangeFromOS) = (Class)a3;
  v3 = a3;

}

- (NSDictionary)markedTextStyle
{
  uint64_t v2;
  NSDictionary v3;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform12CRLWPStorage_markedTextStyle);
  if (v2)
  {
    type metadata accessor for Key(0);
    sub_1005034A0((unint64_t *)&qword_1013DE6D0, 255, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_100EF1874);
    swift_bridgeObjectRetain(v2);
    v3.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v3.super.isa = 0;
  }
  return (NSDictionary *)v3.super.isa;
}

- (void)setMarkedTextStyle:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_class *v8;

  if (a3)
  {
    type metadata accessor for Key(0);
    v6 = v5;
    v7 = sub_1005034A0((unint64_t *)&qword_1013DE6D0, 255, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_100EF1874);
    v8 = (objc_class *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, v6, (char *)&type metadata for Any + 8, v7);
  }
  else
  {
    v8 = 0;
  }
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform12CRLWPStorage_markedTextStyle) = v8;
  swift_bridgeObjectRelease();
}

- (id)copyWithMarkedText
{
  _TtC8Freeform12CRLWPStorage *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_1007D484C();
  v4 = v3;

  return v4;
}

- (CRLCanvasElementInfo)parentInfo
{
  return (CRLCanvasElementInfo *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC8Freeform12CRLWPStorage__parentItem);
}

- (void)setParentInfo:(id)a3
{
  _TtC8Freeform12CRLWPStorage *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_1007D5210((uint64_t)a3);

}

- (_TtC8Freeform17CRLBoardDataStore)store
{
  return (_TtC8Freeform17CRLBoardDataStore *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                     + OBJC_IVAR____TtC8Freeform12CRLWPStorage_store));
}

- (void)setStore:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform12CRLWPStorage_store);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform12CRLWPStorage_store) = (Class)a3;
  v3 = a3;

}

- (_TtC8Freeform8CRLBoard)parentBoard
{
  uint64_t Strong;
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t (*v7)(void);
  _TtC8Freeform12CRLWPStorage *v8;
  void *v9;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC8Freeform12CRLWPStorage__parentItem);
  if (!Strong)
    goto LABEL_5;
  v4 = (void *)Strong;
  v5 = type metadata accessor for CRLContainerItem(0);
  v6 = (_QWORD *)swift_dynamicCastClass(v4, v5);
  if (!v6)
  {

LABEL_5:
    v9 = 0;
    return (_TtC8Freeform8CRLBoard *)v9;
  }
  v7 = *(uint64_t (**)(void))((swift_isaMask & *v6) + 0x2E8);
  v8 = self;
  v9 = (void *)v7();

  return (_TtC8Freeform8CRLBoard *)v9;
}

- (BOOL)isSelectable
{
  return 0;
}

- (BOOL)isSupported
{
  return 1;
}

- (Class)layoutClass
{
  return (Class)swift_getObjCClassFromMetadata(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform12CRLWPStorage_layoutClass), a2);
}

- (Class)repClass
{
  return (Class)sub_1007D54D8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform12CRLWPStorage_repClass);
}

- (Class)editorClass
{
  return (Class)sub_1007D54D8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform12CRLWPStorage_editorClass);
}

- (BOOL)hasVisibleContent
{
  _TtC8Freeform12CRLWPStorage *v2;
  char v3;
  char v4;

  v2 = self;
  sub_1007D551C();
  v4 = v3;

  return v4 & 1;
}

- (NSAttributedString)coreTextAttributedString
{
  char v2;
  _TtC8Freeform12CRLWPStorage *v3;
  NSAttributedString *v4;

  v2 = *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform12CRLWPStorage__hasValidPresentationProperties);
  v3 = self;
  if ((v2 & 1) == 0)
    sub_1007D5878();
  v4 = (NSAttributedString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&v3->super.isa
                                                                     + OBJC_IVAR____TtC8Freeform12CRLWPStorage__coreTextAttributedString));

  return v4;
}

- (id)initFromStorage:(id)a3 withRange:(_NSRange)a4
{
  id result;

  sub_1007D7624((char *)a3, a4.location, a4.length);
  return result;
}

- (int64_t)length
{
  _TtC8Freeform12CRLWPStorage *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  sub_1007D7EB0();
  v4 = v3;

  return v4;
}

- (NSString)string
{
  return (NSString *)sub_100571634(self, (uint64_t)a2, sub_1007D8044);
}

- (NSString)crlaxString
{
  return (NSString *)sub_100571634(self, (uint64_t)a2, sub_1007D81F8);
}

- (void)replaceCharactersIn:(_NSRange)a3 withStorage:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  _TtC8Freeform12CRLWPStorage *v8;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  v8 = self;
  sub_1007DA508(location, length, (uint64_t)v7);

}

- (void)replaceCharactersIn:(_NSRange)a3 with:(id)a4
{
  NSUInteger length;
  int64_t location;
  uint64_t v7;
  int64_t v8;
  BOOL v9;
  int64_t v10;
  uint64_t v11;
  int64_t v12;
  _TtC8Freeform12CRLWPStorage *v13;

  length = a3.length;
  location = a3.location;
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v9 = __OFADD__(location, length);
  v10 = location + length;
  if (v9)
  {
    __break(1u);
  }
  else if (v10 >= location)
  {
    v11 = v7;
    v12 = v8;
    v13 = self;
    sub_1007D876C(location, v10, v11, v12, 1);

    swift_bridgeObjectRelease();
    return;
  }
  __break(1u);
}

- (_TtC8Freeform12CRLWPStorage)init
{
  _TtC8Freeform12CRLWPStorage *result;

  result = (_TtC8Freeform12CRLWPStorage *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLWPStorage", 21, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _QWORD v3[31];

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform12CRLWPStorage_shapeItemData));
  sub_1004C4938((uint64_t)self + OBJC_IVAR____TtC8Freeform12CRLWPStorage_shapeItemTextPresetOverride, (uint64_t)v3, &qword_1013E1B50);
  sub_1006A1C78(v3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_100562F88);

  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8Freeform12CRLWPStorage__parentItem);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_NSRange)range
{
  _TtC8Freeform12CRLWPStorage *v2;
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  _NSRange result;

  v2 = self;
  sub_1007DD1D4();
  v4 = v3;

  v5 = 0;
  v6 = v4;
  result.length = v6;
  result.location = v5;
  return result;
}

- (BOOL)hasSmartFields
{
  _TtC8Freeform12CRLWPStorage *v2;
  id v3;
  uint64_t v4;
  unsigned __int8 v5;

  v2 = self;
  v3 = -[CRLWPStorage range](v2, "range");
  v5 = -[CRLWPStorage hasSmartFieldsInRange:](v2, "hasSmartFieldsInRange:", v3, v4);

  return v5;
}

- (int64_t)hyphenationLocationBeforeIndex:(int64_t)a3 inRange:(_NSRange)a4 locale:(id)a5 hyphenChar:(unsigned int *)a6
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v12;

  v7 = type metadata accessor for Locale(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Locale._unconditionallyBridgeFromObjectiveC(_:)(a5);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)writingDirectionForParagraphAtCharIndex:(int64_t)a3
{
  _TtC8Freeform12CRLWPStorage *v4;
  int64_t v5;
  int64_t v6;

  v4 = self;
  sub_1007DD5D4(a3);
  v6 = v5;

  return v6;
}

- (BOOL)isWritingDirectionRightToLeftForParagraphAtParIndex:(int64_t)a3
{
  _TtC8Freeform12CRLWPStorage *v4;

  v4 = self;
  LOBYTE(a3) = -[CRLWPStorage isWritingDirectionRightToLeftForParagraphAtCharIndex:](v4, "isWritingDirectionRightToLeftForParagraphAtCharIndex:", -[CRLWPStorage textRangeForParagraphAtIndex:](v4, "textRangeForParagraphAtIndex:", a3));

  return a3;
}

- (BOOL)isWritingDirectionRightToLeftForParagraphAtCharIndex:(int64_t)a3
{
  return (id)-[CRLWPStorage writingDirectionForParagraphAtCharIndex:](self, "writingDirectionForParagraphAtCharIndex:", a3) == (id)1;
}

- (_NSRange)textRangeForParagraphsInCharRange:(_NSRange)a3
{
  int64_t length;
  NSUInteger location;
  _TtC8Freeform12CRLWPStorage *v5;
  id v6;
  id v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  id v12;
  id v13;
  NSUInteger v14;
  NSRange v15;
  NSRange v16;
  _NSRange result;
  NSRange v18;

  length = a3.length;
  location = a3.location;
  v5 = self;
  v6 = -[CRLWPStorage paragraphIndexAtCharIndex:](v5, "paragraphIndexAtCharIndex:", location);
  v7 = -[CRLWPStorage textRangeForParagraphAtIndex:](v5, "textRangeForParagraphAtIndex:", v6);
  v9 = (NSUInteger)v7;
  v10 = v8;
  if (length >= 2)
  {
    v11 = location + length;
    if (__OFADD__(location, length))
    {
      __break(1u);
    }
    else if (!__OFSUB__(v11, 1))
    {
      v12 = -[CRLWPStorage paragraphIndexAtCharIndex:](v5, "paragraphIndexAtCharIndex:", v11 - 1);
      v13 = -[CRLWPStorage textRangeForParagraphAtIndex:](v5, "textRangeForParagraphAtIndex:", v12);
      if (v12 != v6)
      {
        v18.location = (NSUInteger)v13;
        v18.length = v14;
        v16.location = v9;
        v16.length = v10;
        v15 = NSUnionRange(v16, v18);
        v9 = v15.location;
        v10 = v15.length;
      }
      goto LABEL_6;
    }
    __break(1u);
    goto LABEL_9;
  }
LABEL_6:

  v7 = (id)v9;
  v8 = v10;
LABEL_9:
  result.length = v8;
  result.location = (NSUInteger)v7;
  return result;
}

- (_NSRange)findRangeOfWordBackwardFromCharIndex:(int64_t)a3 expandingRangeToEndOfWord:(BOOL)a4
{
  _BOOL4 v4;
  _TtC8Freeform12CRLWPStorage *v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  _NSRange result;

  v4 = a4;
  v6 = self;
  sub_1007DD818(a3, v4);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.length = v12;
  result.location = v11;
  return result;
}

- (_NSRange)rangeOfNearestWhitespaceBeforeCharIndex:(int64_t)a3 includingBreaks:(BOOL)a4
{
  _BOOL4 v4;
  _TtC8Freeform12CRLWPStorage *v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  _NSRange result;

  v4 = a4;
  v6 = self;
  sub_1007DDC38(a3, v4);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.length = v12;
  result.location = v11;
  return result;
}

- (BOOL)isEmptyParagraphAtSelection:(id)a3
{
  id v4;
  _TtC8Freeform12CRLWPStorage *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = self;
  v6 = -[CRLWPStorage isEmptyParagraphAtIndex:](v5, "isEmptyParagraphAtIndex:", -[CRLWPStorage paragraphIndexAtCharIndex:](v5, "paragraphIndexAtCharIndex:", objc_msgSend(v4, "leadingCharIndex")));

  return v6;
}

- (BOOL)isEmptyParagraphAtIndex:(int64_t)a3
{
  _TtC8Freeform12CRLWPStorage *v4;
  id v5;
  uint64_t v6;
  unsigned __int8 v7;

  v4 = self;
  v5 = -[CRLWPStorage textRangeForParagraphAtIndex:](v4, "textRangeForParagraphAtIndex:", a3);
  if (v6)
    v7 = sub_1001AE2A0(-[CRLWPStorage characterAtIndex:](v4, "characterAtIndex:", v5));
  else
    v7 = 1;

  return v7;
}

- (id)rangeForParagraphAt:(int64_t)a3
{
  _TtC8Freeform12CRLWPStorage *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;

  v4 = self;
  v5 = -[CRLWPStorage textRangeForParagraphAtIndex:](v4, "textRangeForParagraphAtIndex:", a3);
  v7 = v6;
  v8 = objc_allocWithZone((Class)type metadata accessor for CRLTextRange());
  v9 = (void *)sub_10060EDE4((uint64_t)v5, v7);

  return v9;
}

- (_NSRange)textRangeForParagraphAtIndex:(int64_t)a3
{
  _TtC8Freeform12CRLWPStorage *v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  _NSRange result;

  v4 = self;
  sub_1007DE148(a3);
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (_NSRange)textRangeForParagraphAtCharIndex:(int64_t)a3
{
  _TtC8Freeform12CRLWPStorage *v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  _NSRange result;

  v4 = self;
  sub_1007DE200(a3);
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (id)attachmentOrFootnoteAtCharIndex:(int64_t)a3
{
  return 0;
}

- (id)smartFieldsWithAttributeKind:(unint64_t)a3 intersectingRange:(_NSRange)a4
{
  Swift::Int length;
  Swift::Int location;
  _TtC8Freeform12CRLWPStorage *v7;
  Class isa;

  length = a4.length;
  location = a4.location;
  v7 = self;
  sub_1007DE2D4(a3, location, length);

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (id)smartFieldAtCharIndex:(int64_t)a3 attributeKind:(unint64_t)a4 effectiveRange:(_NSRange *)a5
{
  _TtC8Freeform12CRLWPStorage *v8;
  void *v9;
  void *v10;

  v8 = self;
  sub_1007DE8AC(a3, a4, a5);
  v10 = v9;

  return v10;
}

- (void)enumerateSmartFieldsWithAttributeKind:(unint64_t)a3 inRange:(_NSRange)a4 usingBlock:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  void *v9;
  _TtC8Freeform12CRLWPStorage *v10;

  length = a4.length;
  location = a4.location;
  v9 = _Block_copy(a5);
  _Block_copy(v9);
  v10 = self;
  sub_1007EC2B8(a3, location, length, (char *)v10, (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v9);
  _Block_release(v9);
  _Block_release(v9);

}

- (id)hyperlinkFieldAtCharIndex:(int64_t)a3 effectiveRange:(_NSRange *)a4
{
  _TtC8Freeform12CRLWPStorage *v6;
  void *v7;

  v6 = self;
  v7 = (void *)sub_1007EC830((char *)a3, (char **)a4, &OBJC_IVAR____TtC8Freeform12CRLWPStorage__hyperlinkRuns);

  return v7;
}

- (BOOL)hasColumnBreakAtCharIndex:(int64_t)a3
{
  return 0;
}

- (int64_t)paragraphCount
{
  char v2;
  _TtC8Freeform12CRLWPStorage *v3;
  int64_t v4;

  v2 = *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform12CRLWPStorage__hasValidRanges);
  v3 = self;
  if ((v2 & 1) == 0)
    sub_1007D71A8();
  v4 = (*(_QWORD **)((char *)&v3->super.isa + OBJC_IVAR____TtC8Freeform12CRLWPStorage__paragraphRanges))[2];

  return v4;
}

- (id)paragraphStyleAtParIndex:(int64_t)a3
{
  return -[CRLWPStorage paragraphStyleAtParIndex:effectiveRange:](self, "paragraphStyleAtParIndex:effectiveRange:", a3, 0);
}

- (id)paragraphStyleAtParIndex:(int64_t)a3 effectiveRange:(_NSRange *)a4
{
  _TtC8Freeform12CRLWPStorage *v6;
  void *v7;
  void *v8;

  v6 = self;
  sub_1007DEB7C(a3, a4);
  v8 = v7;

  return v8;
}

- (int64_t)charIndexForParagraphAtIndex:(int64_t)a3
{
  _TtC8Freeform12CRLWPStorage *v4;
  id v5;
  __int128 v7;

  v7 = xmmword_100EEE418;
  v4 = self;
  v5 = -[CRLWPStorage paragraphStyleAtParIndex:effectiveRange:](v4, "paragraphStyleAtParIndex:effectiveRange:", a3, &v7);

  return v7;
}

- (int64_t)paragraphIndexAtCharIndex:(int64_t)a3
{
  return -[CRLWPStorage paragraphIndexAtCharIndex:effectiveRange:](self, "paragraphIndexAtCharIndex:effectiveRange:", a3, 0);
}

- (int64_t)paragraphIndexAtCharIndex:(int64_t)a3 effectiveRange:(_NSRange *)a4
{
  _TtC8Freeform12CRLWPStorage *v6;
  int64_t v7;
  int64_t v8;

  v6 = self;
  sub_1007DED20(a3, (uint64_t *)a4);
  v8 = v7;

  return v8;
}

- (id)paragraphStyleAtCharIndex:(int64_t)a3
{
  return -[CRLWPStorage paragraphStyleAtCharIndex:effectiveRange:](self, "paragraphStyleAtCharIndex:effectiveRange:", a3, 0);
}

- (id)paragraphStyleAtCharIndex:(int64_t)a3 effectiveRange:(_NSRange *)a4
{
  _TtC8Freeform12CRLWPStorage *v6;
  void *v7;
  void *v8;

  v6 = self;
  sub_1007DEE90(a3, (uint64_t *)a4);
  v8 = v7;

  return v8;
}

- (id)characterStyleAtCharIndex:(int64_t)a3
{
  return -[CRLWPStorage characterStyleAtCharIndex:effectiveRange:](self, "characterStyleAtCharIndex:effectiveRange:", a3, 0);
}

- (id)characterStyleAtCharIndex:(int64_t)a3 effectiveRange:(_NSRange *)a4
{
  return -[CRLWPStorage characterStyleAtCharIndex:before:effectiveRange:](self, "characterStyleAtCharIndex:before:effectiveRange:", a3, 1, a4);
}

- (id)characterStyleAtCharIndex:(int64_t)a3 before:(BOOL)a4 effectiveRange:(_NSRange *)a5
{
  _TtC8Freeform12CRLWPStorage *v7;
  void *v8;

  v7 = self;
  v8 = (void *)sub_1007EC830((char *)a3, (char **)a5, &OBJC_IVAR____TtC8Freeform12CRLWPStorage__characterStyleRuns);

  return v8;
}

- (id)numberedListLabelAtCharIndex:(int64_t)a3
{
  _TtC8Freeform12CRLWPStorage *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSString v8;

  v4 = self;
  v5 = -[CRLWPStorage numberedListLabelAtParIndex:](v4, "numberedListLabelAtParIndex:", -[CRLWPStorage paragraphIndexAtCharIndex:](v4, "paragraphIndexAtCharIndex:", a3));
  static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
  v7 = v6;

  v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v7);
  return v8;
}

- (id)numberedListLabelAtParIndex:(int64_t)a3
{
  _TtC8Freeform12CRLWPStorage *v4;
  NSString v5;

  v4 = self;
  sub_1007DF130(a3);

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return v5;
}

- (int64_t)listNumberAtParIndex:(int64_t)a3
{
  _TtC8Freeform12CRLWPStorage *v4;
  int64_t v5;

  v4 = self;
  v5 = sub_1007DF374(a3);

  return v5;
}

- (id)listStyleAtParIndex:(int64_t)a3
{
  return -[CRLWPStorage listStyleAtParIndex:effectiveRange:](self, "listStyleAtParIndex:effectiveRange:", a3, 0);
}

- (id)listStyleAtParIndex:(int64_t)a3 effectiveRange:(_NSRange *)a4
{
  _TtC8Freeform12CRLWPStorage *v6;
  void *v7;
  void *v8;

  v6 = self;
  sub_1007DF50C(a3, a4);
  v8 = v7;

  return v8;
}

- (id)listStyleAtCharIndex:(int64_t)a3
{
  return -[CRLWPStorage listStyleAtCharIndex:effectiveRange:](self, "listStyleAtCharIndex:effectiveRange:", a3, 0);
}

- (id)listStyleAtCharIndex:(int64_t)a3 effectiveRange:(_NSRange *)a4
{
  _TtC8Freeform12CRLWPStorage *v6;
  id v7;

  v6 = self;
  v7 = -[CRLWPStorage listStyleAtParIndex:effectiveRange:](v6, "listStyleAtParIndex:effectiveRange:", -[CRLWPStorage paragraphIndexAtCharIndex:](v6, "paragraphIndexAtCharIndex:", a3), a4);

  return v7;
}

- (int64_t)paragraphLevelAtParIndex:(int64_t)a3
{
  return -[CRLWPStorage paragraphLevelAtParIndex:effectiveRange:](self, "paragraphLevelAtParIndex:effectiveRange:", a3, 0);
}

- (int64_t)paragraphLevelAtParIndex:(int64_t)a3 effectiveRange:(_NSRange *)a4
{
  _TtC8Freeform12CRLWPStorage *v6;
  int64_t v7;
  int64_t v8;

  v6 = self;
  sub_1007DF6B0(a3, a4);
  v8 = v7;

  return v8;
}

- (int64_t)listStartAtParIndex:(int64_t)a3
{
  return -[CRLWPStorage listStartAtParIndex:effectiveRange:](self, "listStartAtParIndex:effectiveRange:", a3, 0);
}

- (int64_t)listStartAtParIndex:(int64_t)a3 effectiveRange:(_NSRange *)a4
{
  _TtC8Freeform12CRLWPStorage *v6;
  int64_t v7;

  v6 = self;
  v7 = sub_1007DF7B8(a3, a4);

  return v7;
}

- (int64_t)charIndexMappedToStorage:(int64_t)a3
{
  return a3;
}

- (int64_t)charIndexMappedFromStorage:(int64_t)a3
{
  return a3;
}

- (_NSRange)charRangeMappedToStorage:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  result.length = length;
  result.location = location;
  return result;
}

- (_NSRange)charRangeMappedFromStorage:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  result.length = length;
  result.location = location;
  return result;
}

- (int64_t)charIndexRemappedFromStorage:(int64_t)a3
{
  return a3;
}

- (_NSRange)charRangeRemappedFromStorage:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  result.length = length;
  result.location = location;
  return result;
}

- (unsigned)characterAtIndex:(int64_t)a3
{
  _TtC8Freeform12CRLWPStorage *v4;
  __int16 v5;

  v4 = self;
  sub_1007DF950(a3);
  LOWORD(a3) = v5;

  return a3;
}

- (unsigned)wpKind
{
  return 3;
}

- (int64_t)attachmentCount
{
  return 0;
}

- (id)substringWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  _TtC8Freeform12CRLWPStorage *v5;
  NSString v6;

  length = a3.length;
  location = a3.location;
  v5 = self;
  sub_1007DFB78(location, length);

  v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return v6;
}

- (BOOL)adjustRangesByDelta:(int64_t)a3 startingAt:(int64_t)a4
{
  return 1;
}

- (BOOL)hasSmartFieldsInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  _TtC8Freeform12CRLWPStorage *v5;

  length = a3.length;
  location = a3.location;
  v5 = self;
  LOBYTE(length) = sub_1007DFDF8(location, length);

  return length & 1;
}

- (unint64_t)changeCount
{
  return 0;
}

- (int64_t)storageLength
{
  _TtC8Freeform12CRLWPStorage *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  sub_1007D7EB0();
  v4 = v3;

  return v4;
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  _TtC8Freeform12CRLWPStorage *v7;

  length = a4.length;
  location = a4.location;
  v7 = self;
  sub_1007E002C((uint64_t)a3, location, length);

}

- (id)stringEquivalentFromRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  _TtC8Freeform12CRLWPStorage *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSString v9;

  length = a3.length;
  location = a3.location;
  v5 = self;
  v6 = -[CRLWPStorage substringWithRange:](v5, "substringWithRange:", location, length);
  static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
  v8 = v7;

  v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v8);
  return v9;
}

- (_NSRange)rangeByExpandingToIncludePartialWords:(_NSRange)a3
{
  char *length;
  NSUInteger location;
  _TtC8Freeform12CRLWPStorage *v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  _NSRange result;

  length = (char *)a3.length;
  location = a3.location;
  v5 = self;
  v6 = sub_1007E02F0(location, length);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (BOOL)allowsTypographicalFractions
{
  return -[CRLWPStorage wpKind](self, "wpKind") != 5;
}

- (BOOL)isAllWhitespaceInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  _TtC8Freeform12CRLWPStorage *v5;
  char v6;

  length = a3.length;
  location = a3.location;
  v5 = self;
  sub_1007E0910(location, length);
  LOBYTE(length) = v6;

  return length & 1;
}

- (id)languageForTextRange:(_NSRange)a3 useStringTokenizer:(BOOL)a4 useDocumentLanguage:(BOOL)a5
{
  return 0;
}

- (id)searchForString:(id)a3 options:(unint64_t)a4 searchCanvasDelegate:(id)a5 onHit:(id)a6
{
  uint64_t (*v10)();
  uint64_t (*v11)();
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _TtC8Freeform12CRLWPStorage *v15;
  id v16;

  v10 = (uint64_t (*)())_Block_copy(a6);
  v11 = v10;
  if (!a3)
  {
    v12 = 0;
    if (v10)
      goto LABEL_3;
LABEL_5:
    v14 = 0;
    goto LABEL_6;
  }
  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  a3 = v13;
  if (!v11)
    goto LABEL_5;
LABEL_3:
  v14 = swift_allocObject(&unk_10127FA20, 24, 7);
  *(_QWORD *)(v14 + 16) = v11;
  v11 = sub_10077F5F8;
LABEL_6:
  swift_unknownObjectRetain(a5);
  v15 = self;
  v16 = sub_1007E0C08(v12, (uint64_t)a3, a4, (uint64_t)a5, (uint64_t)v11, v14);
  sub_1004C1024((uint64_t)v11, v14);
  swift_unknownObjectRelease(a5);

  swift_bridgeObjectRelease();
  return v16;
}

- (void)continueSearch:(id)a3
{
  id v4;
  _TtC8Freeform12CRLWPStorage *v5;

  v4 = a3;
  v5 = self;
  sub_1007E1148(v4);

}

- (id)commandForReplaceAllWithProvider:(id)a3
{
  _TtC8Freeform12CRLWPStorage *v5;
  void *v6;
  void *v7;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_1007E1388(a3);
  v7 = v6;
  swift_unknownObjectRelease(a3);

  return v7;
}

- (BOOL)canUserReplaceText
{
  _TtC8Freeform12CRLWPStorage *v2;
  char v3;

  v2 = self;
  v3 = sub_1007E1F58();

  return v3 & 1;
}

- (int64_t)nextCharacterIndex:(int64_t)a3
{
  _TtC8Freeform12CRLWPStorage *v4;
  int64_t v5;
  int64_t v6;

  v4 = self;
  sub_1007E2030(a3);
  v6 = v5;

  return v6;
}

- (int64_t)previousCharacterIndex:(int64_t)a3
{
  _TtC8Freeform12CRLWPStorage *v4;
  int64_t v5;
  int64_t v6;

  v4 = self;
  sub_1007E23F4(a3);
  v6 = v5;

  return v6;
}

- (_NSRange)wordAtCharIndex:(int64_t)a3 includePreviousWord:(BOOL)a4
{
  id v4;
  NSUInteger v5;
  _NSRange result;

  v4 = -[CRLWPStorage wordAtCharIndex:includePreviousWord:includeHyphenation:](self, "wordAtCharIndex:includePreviousWord:includeHyphenation:", a3, a4, 0);
  result.length = v5;
  result.location = (NSUInteger)v4;
  return result;
}

- (_NSRange)wordAtCharIndex:(int64_t)a3 includePreviousWord:(BOOL)a4 includeHyphenation:(BOOL)a5
{
  _TtC8Freeform12CRLWPStorage *v8;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  _NSRange result;

  v8 = self;
  v9 = sub_1007E28D0(a3, a4, a5);
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.length = v13;
  result.location = v12;
  return result;
}

- (void)setUpForTesting
{
  _TtC8Freeform12CRLWPStorage *v2;

  v2 = self;
  sub_1007E2BBC();

}

@end
