@implementation RAPReportComposerLabelStatusPart

- (RAPReportComposerLabelStatusPart)initWithCorrectableFlag:(id)a3
{
  id v4;
  RAPReportComposerLabelStatusSection *v5;
  void *v6;
  RAPReportComposerLabelStatusPart *v7;
  objc_super v9;
  RAPReportComposerLabelStatusSection *v10;

  v4 = a3;
  v5 = -[RAPReportComposerLabelStatusSection initWithCorrectableFlag:]([RAPReportComposerLabelStatusSection alloc], "initWithCorrectableFlag:", v4);

  v10 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
  v9.receiver = self;
  v9.super_class = (Class)RAPReportComposerLabelStatusPart;
  v7 = -[RAPTablePart initWithSections:](&v9, "initWithSections:", v6);

  if (v7)
    objc_storeStrong((id *)&v7->_statusSection, v5);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusSection, 0);
}

@end
