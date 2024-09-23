@implementation RTPredictedLocationOfInterest(RTStateModel)

- (uint64_t)initWithLocationOfInterest:()RTStateModel confidence:nextEntryTime:motionActivityType:
{
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v10 = (void *)MEMORY[0x1E0D183D0];
  v11 = a5;
  v12 = a4;
  v13 = objc_msgSend(v10, "modeOfTransportationFromMotionActivityType:", a6);
  v14 = objc_alloc(MEMORY[0x1E0D18450]);
  v15 = objc_alloc(MEMORY[0x1E0D18498]);
  objc_msgSend(v12, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithIdentifier:", v16);
  v21[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v14, "initWithLocationOfInterest:confidence:nextEntryTime:modeOfTransportation:sources:", v12, v11, v13, v18, a2);

  return v19;
}

@end
