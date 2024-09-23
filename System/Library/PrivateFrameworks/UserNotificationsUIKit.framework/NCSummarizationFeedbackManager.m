@implementation NCSummarizationFeedbackManager

+ (id)sharedInstance
{
  if (qword_1EFBFA910 != -1)
    swift_once();
  return (id)qword_1EFBFD9C8;
}

+ (id)thumbsUpImage
{
  return sub_1CFD4144C((uint64_t)a1, (uint64_t)a2, MEMORY[0x1E0D21060]);
}

+ (id)thumbsDownImage
{
  return sub_1CFD4144C((uint64_t)a1, (uint64_t)a2, MEMORY[0x1E0D21040]);
}

- (void)thumbsUpFor:(id)a3 isShowingStackSummary:(BOOL)a4
{
  id v6;
  NCSummarizationFeedbackManager *v7;

  v6 = a3;
  v7 = self;
  sub_1CFD43ED4(v6, a4, (uint64_t)&unk_1E8D20678, (uint64_t)&unk_1E8D206A0, (uint64_t)&unk_1EFBFB158);

}

- (void)thumbsDownFor:(id)a3 isShowingStackSummary:(BOOL)a4
{
  id v6;
  NCSummarizationFeedbackManager *v7;

  v6 = a3;
  v7 = self;
  sub_1CFD43ED4(v6, a4, (uint64_t)&unk_1E8D20628, (uint64_t)&unk_1E8D20650, (uint64_t)&unk_1EFBFB0D0);

}

- (NCSummarizationFeedbackManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NCSummarizationFeedbackManager;
  return -[NCSummarizationFeedbackManager init](&v3, sel_init);
}

@end
