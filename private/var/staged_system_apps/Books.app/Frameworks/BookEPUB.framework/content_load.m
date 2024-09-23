@implementation content_load

+ (NSString)sourceName
{
  return (NSString *)CFSTR("content_load.js");
}

+ (NSString)source
{
  return (NSString *)CFSTR("// Copyright  © 2018-2019 Apple Inc. All rights reserved.\nwindow.addEventListener('load',(()=>{iBooks.postMessage('BENavigationHandlerJSLoadComplete',!0)}));\n");
}

@end
