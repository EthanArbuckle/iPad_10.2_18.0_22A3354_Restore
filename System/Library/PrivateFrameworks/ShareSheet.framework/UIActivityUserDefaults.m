@implementation UIActivityUserDefaults

uint64_t __107___UIActivityUserDefaults_activitiesBySortingActivities_byIdentifierWithDefaultActivityIdentifierOrdering___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

void __47___UIActivityUserDefaults_builtinActivityOrder__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[18];

  v2[17] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("com.apple.UIKit.activity.AirDrop");
  v2[1] = CFSTR("com.apple.UIKit.activity.Message");
  v2[2] = CFSTR("com.apple.UIKit.activity.Mail");
  v2[3] = CFSTR("com.apple.UIKit.activity.SharePlay");
  v2[4] = CFSTR("com.apple.UIKit.activity.CollaborationInviteWithLink");
  v2[5] = CFSTR("com.apple.reminders.sharingextension");
  v2[6] = CFSTR("com.apple.mobilenotes.SharingExtension");
  v2[7] = CFSTR("com.apple.UIKit.activity.OpenInIBooks");
  v2[8] = CFSTR("com.apple.UIKit.activity.CollaborationCopyLink");
  v2[9] = CFSTR("com.apple.UIKit.activity.CopyToPasteboard");
  v2[10] = CFSTR("com.apple.UIKit.activity.Share");
  v2[11] = CFSTR("com.apple.UIKit.activity.AddToReadingList");
  v2[12] = CFSTR("com.apple.UIKit.activity.SaveToCameraRoll");
  v2[13] = CFSTR("com.apple.UIKit.activity.AssignToContact");
  v2[14] = CFSTR("com.apple.UIKit.activity.MarkupAsPDF");
  v2[15] = CFSTR("com.apple.UIKit.activity.Print");
  v2[16] = CFSTR("com.apple.UIKit.activity.AddToHomeScreen");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 17);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)builtinActivityOrder_builtinActivityOrder;
  builtinActivityOrder_builtinActivityOrder = v0;

}

void __110___UIActivityUserDefaults_updatedActivityIdentifiersUserOrderWithPreviousOrder_someSortedActivityIdentifiers___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
    objc_msgSend(*(id *)(a1 + 32), "removeObject:", v7);
    if (!objc_msgSend(*(id *)(a1 + 32), "count"))
      *a4 = 1;
  }

}

void __110___UIActivityUserDefaults_updatedActivityIdentifiersUserOrderWithPreviousOrder_someSortedActivityIdentifiers___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  v4 = *(void **)(a1 + 40);
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  objc_msgSend(v4, "objectAtIndexedSubscript:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v5, a2);

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a2 + 1;
}

@end
