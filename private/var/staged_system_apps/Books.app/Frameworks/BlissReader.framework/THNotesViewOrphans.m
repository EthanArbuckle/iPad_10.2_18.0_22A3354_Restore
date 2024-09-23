@implementation THNotesViewOrphans

- (THNotesViewOrphans)init
{
  THNotesViewOrphans *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THNotesViewOrphans;
  v2 = -[THNotesViewOrphans init](&v4, "init");
  if (v2)
    v2->mImage = (UIImage *)+[UIImage th_imageNamed:](UIImage, "th_imageNamed:", CFSTR("notes-general"));
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THNotesViewOrphans;
  -[THNotesViewOrphans dealloc](&v3, "dealloc");
}

- (BOOL)hasGlossaryTerms
{
  return 0;
}

- (BOOL)shouldEnableStudyButton
{
  return 0;
}

- (NSArray)navigationUnits
{
  return 0;
}

- (unint64_t)annotationCount
{
  return -[THAnnotationCache numberOfOrphanedAnnotations](self->mOrphanedAnnotations, "numberOfOrphanedAnnotations");
}

- (unint64_t)annotationCountForStudyCards
{
  return 0;
}

- (NSString)title
{
  return (NSString *)objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Notes from previous versions"), &stru_43D7D8, 0);
}

- (NSString)subtitle
{
  return (NSString *)objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Old Notes"), &stru_43D7D8, 0);
}

- (UIImage)image
{
  return self->mImage;
}

- (BOOL)needsMigration
{
  return 0;
}

- (BOOL)wantsVisibility
{
  return -[THNotesViewOrphans annotationCount](self, "annotationCount") != 0;
}

- (void)updateWithAllAnnotations:(id)a3 orphanedAnnotations:(id)a4 annotationController:(id)a5 navigationModel:(id)a6
{
  _QWORD v10[5];

  self->mOrphanedAnnotations = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_118328;
  v10[3] = &unk_429C60;
  v10[4] = a6;
  self->mOrphanedAnnotations = (THAnnotationCache *)objc_msgSend(a5, "cachedAnnotationsForAnnotations:withFilter:", a4, v10);
}

- (NSArray)sectionArray
{
  NSArray *v3;
  THNotesViewSection *v4;

  v3 = (NSArray *)+[NSMutableArray array](NSMutableArray, "array");
  v4 = objc_alloc_init(THNotesViewSection);
  -[NSArray addObject:](v3, "addObject:", v4);
  -[THNotesViewSection setTitle:](v4, "setTitle:", objc_msgSend(objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Old Notes"), &stru_43D7D8, 0), "stringByTransformingForTHNotesSectionHeader"));
  -[THNotesViewSection setNotes:](v4, "setNotes:", -[THAnnotationCache highlightAnnotationsSortedByRange](self->mOrphanedAnnotations, "highlightAnnotationsSortedByRange"));

  return v3;
}

- (BOOL)isAllNotes
{
  return 0;
}

- (BOOL)isOrphanedNotes
{
  return 1;
}

@end
