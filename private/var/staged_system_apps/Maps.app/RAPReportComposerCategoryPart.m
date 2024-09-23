@implementation RAPReportComposerCategoryPart

- (RAPReportComposerCategoryPart)initWithCategoryQuestion:(id)a3 selection:(id)a4
{
  id v6;
  id v7;
  RAPReportComposerCategoryPart *v8;
  RAPReportComposerCategoryPart *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)RAPReportComposerCategoryPart;
  v8 = -[RAPTablePart initWithSections:](&v11, "initWithSections:", &__NSArray0__struct);
  v9 = v8;
  if (v8)
    -[RAPReportComposerCategoryPart _createSectionsForQuestion:withSelection:](v8, "_createSectionsForQuestion:withSelection:", v6, v7);

  return v9;
}

- (void)_createSectionsForQuestion:(id)a3 withSelection:(id)a4
{
  id v6;
  void *v7;
  char *v8;
  char *v9;
  char *v10;
  void *v11;
  void *v12;
  id v13;
  RAPReportComposerMenuSection *v14;
  id v15;
  id v16;

  v16 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v8 = (char *)objc_msgSend(v16, "numberOfSections");
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = 0;
    do
    {
      if (v10)
      {
        v12 = 0;
      }
      else
      {
        v13 = objc_msgSend((id)objc_opt_class(v16), "localizedHeaderText");
        v12 = (void *)objc_claimAutoreleasedReturnValue(v13);
      }

      v14 = -[RAPReportComposerMenuSection initWithMenu:headerText:menuSectionIndex:selection:]([RAPReportComposerMenuSection alloc], "initWithMenu:headerText:menuSectionIndex:selection:", v16, v12, v10, v6);
      objc_msgSend(v7, "addObject:", v14);

      ++v10;
      v11 = v12;
    }
    while (v9 != v10);

  }
  v15 = objc_msgSend(v7, "copy");
  -[RAPTablePart setSections:](self, "setSections:", v15);

}

@end
