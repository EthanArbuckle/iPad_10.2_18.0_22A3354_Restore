@implementation PXGenerativeStoryTTRWorkflowBuilder

+ (void)presentViewController:(id)a3 memory:(id)a4 attachmentFileUrls:(id)a5
{
  uint64_t v5;
  id v8;
  id v9;

  v5 = (uint64_t)a5;
  if (a5)
  {
    sub_1A7ADC8A0();
    v5 = sub_1A7AE3A10();
  }
  swift_getObjCClassMetadata();
  v8 = a3;
  v9 = a4;
  static GenerativeStoryTTRWorkflowBuilder.presentWorkflow(in:memory:attachmentFileURLs:)(v8, v9, v5);

  swift_bridgeObjectRelease();
}

- (PXGenerativeStoryTTRWorkflowBuilder)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for GenerativeStoryTTRWorkflowBuilder();
  return -[PXGenerativeStoryTTRWorkflowBuilder init](&v3, sel_init);
}

@end
