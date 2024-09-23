@implementation PXSocialGroupActionFactory

+ (id)actionForCreatingSocialGroupWithPeople:(id)a3
{
  id v3;
  PXCreateSocialGroupAction *v4;

  v3 = a3;
  v4 = -[PXCreateSocialGroupAction initWithPeople:customTitle:creationCompletionBlock:]([PXCreateSocialGroupAction alloc], "initWithPeople:customTitle:creationCompletionBlock:", v3, 0, 0);

  return v4;
}

+ (id)actionForAddingPeople:(id)a3 toSocialGroup:(id)a4
{
  id v5;
  id v6;
  PXModifySocialGroupAction *v7;
  void *v8;
  PXModifySocialGroupAction *v9;

  v5 = a4;
  v6 = a3;
  v7 = [PXModifySocialGroupAction alloc];
  objc_msgSend(v6, "fetchedObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[PXModifySocialGroupAction initWithOriginalSocialGroup:newKeyAsset:newCustomTitle:customTitleWasDeleted:peopleToBeAdded:peopleToBeRemoved:](v7, "initWithOriginalSocialGroup:newKeyAsset:newCustomTitle:customTitleWasDeleted:peopleToBeAdded:peopleToBeRemoved:", v5, 0, 0, 0, v8, 0);
  return v9;
}

+ (id)actionForRemovingPeople:(id)a3 fromSocialGroup:(id)a4
{
  id v5;
  id v6;
  PXModifySocialGroupAction *v7;
  void *v8;
  PXModifySocialGroupAction *v9;

  v5 = a4;
  v6 = a3;
  v7 = [PXModifySocialGroupAction alloc];
  objc_msgSend(v6, "fetchedObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[PXModifySocialGroupAction initWithOriginalSocialGroup:newKeyAsset:newCustomTitle:customTitleWasDeleted:peopleToBeAdded:peopleToBeRemoved:](v7, "initWithOriginalSocialGroup:newKeyAsset:newCustomTitle:customTitleWasDeleted:peopleToBeAdded:peopleToBeRemoved:", v5, 0, 0, 0, 0, v8);
  return v9;
}

+ (id)actionForRenamingSocialGroup:(id)a3 newTitle:(id)a4
{
  id v5;
  id v6;
  PXModifySocialGroupAction *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[PXModifySocialGroupAction initWithOriginalSocialGroup:newKeyAsset:newCustomTitle:customTitleWasDeleted:peopleToBeAdded:peopleToBeRemoved:]([PXModifySocialGroupAction alloc], "initWithOriginalSocialGroup:newKeyAsset:newCustomTitle:customTitleWasDeleted:peopleToBeAdded:peopleToBeRemoved:", v6, 0, v5, objc_msgSend(v5, "length") == 0, 0, 0);

  return v7;
}

@end
