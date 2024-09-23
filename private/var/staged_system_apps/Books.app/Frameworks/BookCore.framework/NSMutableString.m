@implementation NSMutableString

- (void)AEReplaceTemplatePlaceholder:(id)a3 withString:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSMutableString *v9;
  id v10;
  const __CFString *v11;
  __CFString *v12;

  v12 = (__CFString *)a4;
  v6 = a3;
  v7 = -[__CFString length](v12, "length");
  v8 = -[NSMutableString length](self, "length");
  if (v7)
  {
    v9 = self;
    v10 = v6;
    v11 = v12;
  }
  else
  {
    v11 = &stru_296430;
    v9 = self;
    v10 = v6;
  }
  -[NSMutableString replaceOccurrencesOfString:withString:options:range:](v9, "replaceOccurrencesOfString:withString:options:range:", v10, v11, 0, 0, v8);

}

- (void)bkReplaceTemplatePlaceholder:(id)a3 withString:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSMutableString *v9;
  id v10;
  const __CFString *v11;
  __CFString *v12;

  v12 = (__CFString *)a4;
  v6 = a3;
  v7 = -[__CFString length](v12, "length");
  v8 = -[NSMutableString length](self, "length");
  if (v7)
  {
    v9 = self;
    v10 = v6;
    v11 = v12;
  }
  else
  {
    v11 = &stru_296430;
    v9 = self;
    v10 = v6;
  }
  -[NSMutableString replaceOccurrencesOfString:withString:options:range:](v9, "replaceOccurrencesOfString:withString:options:range:", v10, v11, 0, 0, v8);

}

- (void)bkMakeSubstitutionsWithDictionary:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_CBF8C;
  v3[3] = &unk_290A48;
  v3[4] = self;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v3);
}

@end
