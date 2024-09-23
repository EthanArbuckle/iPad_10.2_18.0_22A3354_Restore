@implementation MailComposeViewAnnotationBridge

+ (void)registerMailViewAnnotationDelegate:(id)a3
{
  swift_getObjCClassMetadata(a1);
  swift_unknownObjectRetain(a3);
  swift_getObjCClassMetadata(a1);
  static MailComposeViewAnnotationBridge.registerMailViewAnnotationDelegate(_:)((uint64_t)a3);
  swift_unknownObjectRelease(a3);
}

+ (void)unregisterMailViewAnnotationDelegate:(id)a3
{
  swift_getObjCClassMetadata(a1);
  swift_unknownObjectRetain(a3);
  swift_getObjCClassMetadata(a1);
  static MailComposeViewAnnotationBridge.unregisterMailViewAnnotationDelegate(_:)((uint64_t)a3);
  swift_unknownObjectRelease(a3);
}

- (_TtC10MobileMail31MailComposeViewAnnotationBridge)init
{
  return (_TtC10MobileMail31MailComposeViewAnnotationBridge *)MailComposeViewAnnotationBridge.init()();
}

@end
