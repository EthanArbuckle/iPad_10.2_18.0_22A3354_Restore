@implementation TSUAssertionHandler

+ (void)installAsNSHandler
{
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17F0], "currentThread"), "threadDictionary"), "setObject:forKey:", objc_msgSend(a1, "currentHandler"), CFSTR("NSAssertionHandler"));
}

+ (id)currentHandler
{
  void *v2;
  uint64_t v3;
  TSUAssertionHandler *v4;
  BOOL v5;

  v2 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17F0], "currentThread"), "threadDictionary");
  v3 = objc_msgSend(v2, "objectForKey:", CFSTR("TSUAssertionHandler"));
  v4 = (TSUAssertionHandler *)v3;
  if (v2)
    v5 = v3 == 0;
  else
    v5 = 0;
  if (v5)
  {
    v4 = objc_alloc_init(TSUAssertionHandler);
    objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("TSUAssertionHandler"));

  }
  return v4;
}

+ (void)testCaseStarted:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_msgSend(a3, "object");
  v4 = v3;

  _senTestCaseRun = (uint64_t)v3;
  _senTestCasePool = (uint64_t)objc_alloc_init(MEMORY[0x24BDD1460]);
}

+ (void)testCaseStopped:(id)a3
{

  _senTestCasePool = 0;
  _senTestCaseRun = 0;
}

+ (id)performBlockIgnoringAssertions:(id)a3
{
  uint64_t v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  v3 = _callbackBlock;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __54__TSUAssertionHandler_performBlockIgnoringAssertions___block_invoke;
  v6[3] = &unk_24D61AC40;
  v6[4] = &v7;
  _callbackBlock = (uint64_t)v6;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  _callbackBlock = v3;
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __54__TSUAssertionHandler_performBlockIgnoringAssertions___block_invoke(uint64_t a1, void *a2)
{
  id result;

  TSULogSink((uint64_t)CFSTR("Error"), (NSString *)CFSTR("*** Ignored previous assertion failure ***"));
  result = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (void)handleFailureInMethod:(SEL)a3 object:(id)a4 file:(id)a5 lineNumber:(int64_t)a6 description:(id)a7
{
  objc_class *v13;
  void *v14;
  uint64_t v15;
  NSString *v16;
  NSString *v17;
  uint64_t v18;

  v13 = (objc_class *)objc_opt_class();
  v14 = (void *)MEMORY[0x24BDD17C8];
  v16 = NSStringFromClass(v13);
  v17 = NSStringFromSelector(a3);
  v15 = 45;
  if (v13 == a4)
    v15 = 43;
  -[TSUAssertionHandler handleFailureWithLocation:file:lineNumber:description:arguments:](self, "handleFailureWithLocation:file:lineNumber:description:arguments:", objc_msgSend(v14, "stringWithFormat:", CFSTR("%c[%@ %@]"), v15, v16, v17), a5, a6, a7, &v18);
}

- (void)handleFailureInFunction:(id)a3 file:(id)a4 lineNumber:(int64_t)a5 description:(id)a6
{
  uint64_t v6;

  -[TSUAssertionHandler handleFailureWithLocation:file:lineNumber:description:arguments:](self, "handleFailureWithLocation:file:lineNumber:description:arguments:", a3, a4, a5, a6, &v6);
}

- (void)handleFailureWithLocation:(id)a3 file:(id)a4 lineNumber:(int64_t)a5 description:(id)a6 arguments:(char *)a7
{
  void *v10;
  uint64_t v11;

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", a6, a7);
  v11 = objc_msgSend(a4, "lastPathComponent");
  TSULogSink((uint64_t)CFSTR("Error"), (NSString *)CFSTR("*** Assertion failure #%lu: %@ %@:%d %@"), ++handleFailureWithLocation_file_lineNumber_description_arguments__assertionCount, a3, v11, a5, v10);

}

@end
