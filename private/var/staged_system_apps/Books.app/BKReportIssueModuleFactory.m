@implementation BKReportIssueModuleFactory

+ (void)instantiateWithAnalyticsContentId:(NSString *)a3 analyticsSupplementalContentCount:(NSNumber *)a4 analyticsTracker:(_TtC13BookAnalytics9BATracker *)a5 completionHandler:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  NSString *v19;
  NSNumber *v20;
  _TtC13BookAnalytics9BATracker *v21;
  uint64_t v22;
  uint64_t v23;

  v11 = sub_10004CFD4(&qword_1009D3150);
  __chkstk_darwin(v11);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (_QWORD *)swift_allocObject(&unk_10090E450, 56, 7);
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = a1;
  v16 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject(&unk_10090E478, 48, 7);
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1009EA5C0;
  v17[5] = v15;
  v18 = (_QWORD *)swift_allocObject(&unk_10090E4A0, 48, 7);
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1009D76E0;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = sub_1005D61EC((uint64_t)v13, (uint64_t)&unk_1009E5570, (uint64_t)v18);
  swift_release(v22);
}

- (BKReportIssueModuleFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[BKReportIssueModuleFactory init](&v3, "init");
}

@end
