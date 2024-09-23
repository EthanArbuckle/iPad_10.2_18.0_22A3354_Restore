@implementation TCMessageException

+ (void)initialize
{
  uint64_t v2;

  if ((id)objc_opt_class(TCMessageException, a2) == a1 && (byte_543364 & 1) == 0)
  {
    byte_543364 = 1;
    objc_opt_class(TCCommonMessages, v2);
  }
}

- (TCMessageException)initWithMessage:(TCTaggedMessageStructure *)a3
{
  TCMessageException *v4;
  objc_super v6;
  uint64_t v7;

  v6.receiver = self;
  v6.super_class = (Class)TCMessageException;
  v4 = -[TCMessageException initWithName:reason:userInfo:](&v6, "initWithName:reason:userInfo:", CFSTR("TCMessageException"), 0, 0);
  if (v4)
    v4->m_entry = -[TCMessageEntry initWithTag:affectedObject:text:parameters:]([TCMessageEntry alloc], "initWithTag:affectedObject:text:parameters:", a3->var0, 0, a3->var1, &v7);
  return v4;
}

- (TCMessageException)initWithUntaggedMessage:(id)a3
{
  TCMessageException *v4;
  objc_super v6;
  uint64_t v7;

  v6.receiver = self;
  v6.super_class = (Class)TCMessageException;
  v4 = -[TCMessageException initWithName:reason:userInfo:](&v6, "initWithName:reason:userInfo:", CFSTR("TCMessageException"), 0, 0);
  if (v4)
    v4->m_entry = -[TCMessageEntry initWithTag:affectedObject:text:parameters:]([TCMessageEntry alloc], "initWithTag:affectedObject:text:parameters:", 0xFFFFFFFFLL, 0, a3, &v7);
  return v4;
}

+ (id)exceptionWithMessage:(TCTaggedMessageStructure *)a3
{
  _QWORD *v4;
  uint64_t v6;

  v4 = objc_msgSend(objc_alloc((Class)a1), "initWithName:reason:userInfo:", CFSTR("TCMessageException"), 0, 0);
  if (v4)
    v4[5] = -[TCMessageEntry initWithTag:affectedObject:text:parameters:]([TCMessageEntry alloc], "initWithTag:affectedObject:text:parameters:", a3->var0, 0, a3->var1, &v6);
  return v4;
}

+ (id)exceptionWithUntaggedMessage:(id)a3
{
  _QWORD *v4;
  uint64_t v6;

  v4 = objc_msgSend(objc_alloc((Class)a1), "initWithName:reason:userInfo:", CFSTR("TCMessageException"), 0, 0);
  if (v4)
    v4[5] = -[TCMessageEntry initWithTag:affectedObject:text:parameters:]([TCMessageEntry alloc], "initWithTag:affectedObject:text:parameters:", 0xFFFFFFFFLL, 0, a3, &v6);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TCMessageException;
  -[TCMessageException dealloc](&v3, "dealloc");
}

- (id)getEntry
{
  return self->m_entry;
}

+ (void)raise:(TCTaggedMessageStructure *)a3
{
  TCMessageException *v4;
  uint64_t v5;

  v4 = +[TCMessageException exceptionWithName:reason:userInfo:](TCMessageException, "exceptionWithName:reason:userInfo:", CFSTR("TCMessageException"), 0, 0);
  v4->m_entry = -[TCMessageEntry initWithTag:affectedObject:text:parameters:]([TCMessageEntry alloc], "initWithTag:affectedObject:text:parameters:", a3->var0, 0, a3->var1, &v5);
  -[TCMessageException raise](v4, "raise");
}

+ (void)raiseUntaggedMessage:(id)a3
{
  TCMessageException *v4;
  uint64_t v5;

  v4 = +[TCMessageException exceptionWithName:reason:userInfo:](TCMessageException, "exceptionWithName:reason:userInfo:", CFSTR("TCMessageException"), 0, 0);
  v4->m_entry = -[TCMessageEntry initWithTag:affectedObject:text:parameters:]([TCMessageEntry alloc], "initWithTag:affectedObject:text:parameters:", 0xFFFFFFFFLL, 0, a3, &v5);
  -[TCMessageException raise](v4, "raise");
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("TCMessageException: %@"), -[TCMessageEntry description](self->m_entry, "description"));
}

+ (id)nsError:(id)a3 domain:(id)a4
{
  uint64_t v6;
  id v7;
  signed int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  NSDictionary *v12;
  id v13;
  objc_class *v14;
  id result;

  v6 = objc_opt_class(TCMessageException);
  if ((objc_opt_isKindOfClass(a3, v6) & 1) != 0)
  {
    v7 = objc_msgSend(objc_msgSend(a3, "getEntry"), "getMessageText");
    v8 = objc_msgSend(objc_msgSend(a3, "getEntry"), "getMessageTag");
  }
  else
  {
    v9 = TCUnknownProblemMessage;
    v10 = objc_msgSend(objc_msgSend(a3, "name"), "isEqualToString:", NSMallocException);
    v8 = 0;
    v11 = TCOutOfMemoryMessage;
    if (!v10)
      v11 = v9;
    v7 = *(id *)(v11 + 8);
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("TCUserCancelled")))
  {
    v12 = 0;
    a4 = NSCocoaErrorDomain;
    v8 = 3072;
  }
  else
  {
    v12 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v7, NSLocalizedDescriptionKey, 0);
  }
  v13 = objc_msgSend(a3, "userInfo");
  v14 = (objc_class *)objc_opt_class(NSError);
  result = objc_msgSend(v13, "objectForKeyedSubscript:", NSStringFromClass(v14));
  if (!result)
    return +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", a4, v8, v12);
  return result;
}

@end
