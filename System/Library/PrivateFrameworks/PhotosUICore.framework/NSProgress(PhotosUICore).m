@implementation NSProgress(PhotosUICore)

- (void)px_appendChild:()PhotosUICore withPendingUnitCount:
{
  id v6;

  v6 = a3;
  objc_msgSend(a1, "setTotalUnitCount:", objc_msgSend(a1, "totalUnitCount") + a4);
  objc_msgSend(a1, "addChild:withPendingUnitCount:", v6, a4);

}

- (void)px_appendSimulatedProgressWithDuration:()PhotosUICore pendingUnitCount:
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", (int)(a2 * 1000.0));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "px_appendChild:withPendingUnitCount:", v6, a4);
  objc_msgSend(v6, "_px_performSimulatedWorkStep:", 0);

}

- (void)_px_performSimulatedWorkStep:()PhotosUICore
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  dispatch_time_t v9;
  NSObject *v10;
  _QWORD v11[6];

  if (a3 >= 1)
  {
    v5 = objc_msgSend(a1, "completedUnitCount") + 250;
    v6 = objc_msgSend(a1, "totalUnitCount");
    if (v5 >= v6)
      v7 = v6;
    else
      v7 = v5;
    objc_msgSend(a1, "setCompletedUnitCount:", v7);
  }
  objc_msgSend(a1, "fractionCompleted");
  if (v8 < 1.0)
  {
    v9 = dispatch_time(0, 250000000);
    dispatch_get_global_queue(0, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __57__NSProgress_PhotosUICore___px_performSimulatedWorkStep___block_invoke;
    v11[3] = &unk_1E5144EB8;
    v11[4] = a1;
    v11[5] = a3;
    dispatch_after(v9, v10, v11);

  }
}

@end
