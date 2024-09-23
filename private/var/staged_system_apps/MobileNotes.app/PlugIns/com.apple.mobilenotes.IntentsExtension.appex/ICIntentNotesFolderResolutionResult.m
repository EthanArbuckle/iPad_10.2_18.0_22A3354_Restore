@implementation ICIntentNotesFolderResolutionResult

+ (id)successWithResolvedIntentNotesFolder:(id)a3
{
  id v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___ICIntentNotesFolderResolutionResult;
  v3 = objc_msgSendSuper2(&v5, "successWithResolvedObject:", a3);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

+ (id)disambiguationWithIntentNotesFoldersToDisambiguate:(id)a3
{
  id v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___ICIntentNotesFolderResolutionResult;
  v3 = objc_msgSendSuper2(&v5, "disambiguationWithObjectsToDisambiguate:", a3);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

+ (id)confirmationRequiredWithIntentNotesFolderToConfirm:(id)a3
{
  id v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___ICIntentNotesFolderResolutionResult;
  v3 = objc_msgSendSuper2(&v5, "confirmationRequiredWithObjectToConfirm:", a3);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

@end
