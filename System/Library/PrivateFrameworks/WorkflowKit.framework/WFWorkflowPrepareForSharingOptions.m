@implementation WFWorkflowPrepareForSharingOptions

- (WFWorkflowPrepareForSharingOptions)init
{
  WFWorkflowPrepareForSharingOptions *v2;
  WFWorkflowPrepareForSharingOptions *v3;
  WFWorkflowPrepareForSharingOptions *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFWorkflowPrepareForSharingOptions;
  v2 = -[WFWorkflowPrepareForSharingOptions init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[WFWorkflowPrepareForSharingOptions setClearsImportQuestionData:](v2, "setClearsImportQuestionData:", 1);
    v4 = v3;
  }

  return v3;
}

- (BOOL)clearsImportQuestionData
{
  return self->_clearsImportQuestionData;
}

- (void)setClearsImportQuestionData:(BOOL)a3
{
  self->_clearsImportQuestionData = a3;
}

- (NSSet)quickActionSurfaces
{
  return self->_quickActionSurfaces;
}

- (void)setQuickActionSurfaces:(id)a3
{
  objc_storeStrong((id *)&self->_quickActionSurfaces, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quickActionSurfaces, 0);
}

@end
