@implementation MFDestructiveTriageInteractionFactory

+ (id)interactionWithMessageListItemSelection:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6 deleteOrArchive:(unint64_t)a7
{
  id v12;
  id v13;
  void *v14;

  v12 = a3;
  v13 = a4;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(objc_msgSend(a1, "interactionClassForMSDeleteOrArchive:", a7), "interactionWithMessageListItemSelection:undoManager:origin:actor:", v12, v13, a5, a6));

  return v14;
}

+ (id)interactionWithMessageListItems:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6 deleteOrArchive:(unint64_t)a7
{
  id v12;
  id v13;
  void *v14;

  v12 = a3;
  v13 = a4;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(objc_msgSend(a1, "interactionClassForMSDeleteOrArchive:", a7), "interactionWithMessageListItems:undoManager:origin:actor:", v12, v13, a5, a6));

  return v14;
}

+ (Class)interactionClassForMSDeleteOrArchive:(unint64_t)a3
{
  if (a3 > 2)
    return (Class)0;
  else
    return (Class)(id)objc_opt_class(*off_100520F38[a3]);
}

@end
