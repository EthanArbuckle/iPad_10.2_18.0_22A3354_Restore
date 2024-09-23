@implementation BEWebProcessJavaScriptAPI

+ (void)exportForContext:(id)a3
{
  JSContextGroupRef Group;
  id v4;

  v4 = a3;
  Group = JSContextGetGroup((JSContextRef)objc_msgSend(v4, "JSGlobalContextRef"));
  JSContextGroupSetExecutionTimeLimit(Group, sub_11F98, 0, 10.0);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &stru_20978, CFSTR("adjustedTextRectsForRange"));

}

@end
