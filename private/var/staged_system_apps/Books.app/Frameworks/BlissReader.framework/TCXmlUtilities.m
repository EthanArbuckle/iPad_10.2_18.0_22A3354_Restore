@implementation TCXmlUtilities

+ (id)bundlePathForXmlResource:(id)a3
{
  void *v4;
  id result;

  v4 = (void *)TCBundle();
  result = objc_msgSend(v4, "pathForResource:ofType:", a3, CFSTR("xml.gz"));
  if (!result)
    return objc_msgSend(v4, "pathForResource:ofType:", a3, CFSTR("xml"));
  return result;
}

+ (void)checkStreamNamespaceAndName:(_xmlTextReader *)a3 name:(const char *)a4 ns:(id)a5
{
  objc_msgSend(a1, "checkStreamNamespace:ns:", a3, a5);
  objc_msgSend(a1, "checkStreamName:name:", a3, a4);
}

@end
