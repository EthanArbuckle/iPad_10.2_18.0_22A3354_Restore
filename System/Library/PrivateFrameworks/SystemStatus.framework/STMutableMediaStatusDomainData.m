@implementation STMutableMediaStatusDomainData

- (void)setMutedAudioRecordingAttributions:(id)a3
{
  id v4;

  objc_msgSend(a3, "allObjects");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[STMutableMediaStatusDomainData setMutedAudioRecordingAttributionList:](self, "setMutedAudioRecordingAttributionList:", v4);

}

- (void)setAudioRecordingAttributions:(id)a3
{
  id v4;

  objc_msgSend(a3, "allObjects");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[STMutableMediaStatusDomainData setAudioRecordingAttributionList:](self, "setAudioRecordingAttributionList:", v4);

}

- (void)setMicrophoneRecordingAttributions:(id)a3
{
  id v4;

  if (a3)
  {
    objc_msgSend(a3, "bs_map:", &__block_literal_global_145);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[STMutableMediaStatusDomainData setMicrophoneAttributions:](self, "setMicrophoneAttributions:", v4);

  }
}

- (STMutableMediaStatusDomainData)initWithMicrophoneAttributionListData:(id)a3 mutedMicrophoneRecordingAttributionListData:(id)a4 systemAudioRecordingAttributionListData:(id)a5 cameraAttributionListData:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  STMutableMediaStatusDomainData *v17;
  objc_super v19;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = (void *)objc_msgSend(a3, "mutableCopy");
  v14 = (void *)objc_msgSend(v12, "mutableCopy");

  v15 = (void *)objc_msgSend(v11, "mutableCopy");
  v16 = (void *)objc_msgSend(v10, "mutableCopy");

  v19.receiver = self;
  v19.super_class = (Class)STMutableMediaStatusDomainData;
  v17 = -[STMediaStatusDomainData _initWithMicrophoneAttributionListData:mutedMicrophoneRecordingAttributionListData:systemAudioRecordingAttributionListData:cameraAttributionListData:](&v19, sel__initWithMicrophoneAttributionListData_mutedMicrophoneRecordingAttributionListData_systemAudioRecordingAttributionListData_cameraAttributionListData_, v13, v14, v15, v16);

  return v17;
}

- (void)setCameraAttributions:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (v8)
  {
    -[STMediaStatusDomainData cameraAttributions](self, "cameraAttributions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToArray:", v8);

    if ((v5 & 1) == 0)
    {
      -[STMutableMediaStatusDomainData cameraAttributionListData](self, "cameraAttributionListData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v8, "copy");
      objc_msgSend(v6, "setObjects:", v7);

    }
  }

}

- (void)setMicrophoneAttributions:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (v8)
  {
    -[STMediaStatusDomainData microphoneAttributions](self, "microphoneAttributions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToArray:", v8);

    if ((v5 & 1) == 0)
    {
      -[STMutableMediaStatusDomainData microphoneAttributionListData](self, "microphoneAttributionListData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v8, "copy");
      objc_msgSend(v6, "setObjects:", v7);

    }
  }

}

- (void)setMutedMicrophoneRecordingAttributions:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (v8)
  {
    -[STMediaStatusDomainData mutedMicrophoneRecordingAttributions](self, "mutedMicrophoneRecordingAttributions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToArray:", v8);

    if ((v5 & 1) == 0)
    {
      -[STMutableMediaStatusDomainData mutedMicrophoneRecordingAttributionListData](self, "mutedMicrophoneRecordingAttributionListData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v8, "copy");
      objc_msgSend(v6, "setObjects:", v7);

    }
  }

}

- (STMutableListData)systemAudioRecordingAttributionListData
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STMutableMediaStatusDomainData;
  -[STMediaStatusDomainData systemAudioRecordingAttributionListData](&v3, sel_systemAudioRecordingAttributionListData);
  return (STMutableListData *)(id)objc_claimAutoreleasedReturnValue();
}

- (STMutableListData)microphoneAttributionListData
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STMutableMediaStatusDomainData;
  -[STMediaStatusDomainData microphoneAttributionListData](&v3, sel_microphoneAttributionListData);
  return (STMutableListData *)(id)objc_claimAutoreleasedReturnValue();
}

- (STMutableListData)mutedMicrophoneRecordingAttributionListData
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STMutableMediaStatusDomainData;
  -[STMediaStatusDomainData mutedMicrophoneRecordingAttributionListData](&v3, sel_mutedMicrophoneRecordingAttributionListData);
  return (STMutableListData *)(id)objc_claimAutoreleasedReturnValue();
}

- (STMutableListData)cameraAttributionListData
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STMutableMediaStatusDomainData;
  -[STMediaStatusDomainData cameraAttributionListData](&v3, sel_cameraAttributionListData);
  return (STMutableListData *)(id)objc_claimAutoreleasedReturnValue();
}

STMediaStatusDomainCameraCaptureAttribution *__66__STMutableMediaStatusDomainData_setCameraCaptureAttributionList___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  STMediaStatusDomainCameraCaptureAttribution *v3;
  STMediaStatusDomainCameraDescriptor *v4;
  STMediaStatusDomainCameraCaptureAttribution *v5;

  v2 = a2;
  v3 = [STMediaStatusDomainCameraCaptureAttribution alloc];
  v4 = objc_alloc_init(STMediaStatusDomainCameraDescriptor);
  v5 = -[STMediaStatusDomainCameraCaptureAttribution initWithCameraDescriptor:activityAttribution:](v3, "initWithCameraDescriptor:activityAttribution:", v4, v2);

  return v5;
}

- (void)setSystemAudioRecordingAttributions:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (v8)
  {
    -[STMediaStatusDomainData systemAudioRecordingAttributions](self, "systemAudioRecordingAttributions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToArray:", v8);

    if ((v5 & 1) == 0)
    {
      -[STMutableMediaStatusDomainData systemAudioRecordingAttributionListData](self, "systemAudioRecordingAttributionListData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v8, "copy");
      objc_msgSend(v6, "setObjects:", v7);

    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[STMediaStatusDomainData initWithData:](+[STMediaStatusDomainData allocWithZone:](STMediaStatusDomainData, "allocWithZone:", a3), self);
}

- (BOOL)applyDiff:(id)a3
{
  id v4;
  char isKindOfClass;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    objc_msgSend(v4, "applyToMutableData:", self);

  return isKindOfClass & 1;
}

- (void)setCameraCaptureAttributions:(id)a3
{
  id v4;

  objc_msgSend(a3, "allObjects");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[STMutableMediaStatusDomainData setCameraCaptureAttributionList:](self, "setCameraCaptureAttributionList:", v4);

}

- (void)setCameraCaptureAttributionList:(id)a3
{
  id v4;

  if (a3)
  {
    objc_msgSend(a3, "bs_map:", &__block_literal_global_146);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[STMutableMediaStatusDomainData setCameraAttributions:](self, "setCameraAttributions:", v4);

  }
}

STMediaStatusDomainMicrophoneRecordingAttribution *__69__STMutableMediaStatusDomainData_setMicrophoneRecordingAttributions___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  STMediaStatusDomainMicrophoneRecordingAttribution *v3;

  v2 = a2;
  v3 = -[STMediaStatusDomainMicrophoneRecordingAttribution initWithActivityAttribution:]([STMediaStatusDomainMicrophoneRecordingAttribution alloc], "initWithActivityAttribution:", v2);

  return v3;
}

- (void)addCameraAttribution:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[STMutableMediaStatusDomainData cameraAttributionListData](self, "cameraAttributionListData");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v4);

  }
}

- (void)removeCameraAttribution:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[STMutableMediaStatusDomainData cameraAttributionListData](self, "cameraAttributionListData");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v4);

  }
}

- (void)addMicrophoneAttribution:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[STMutableMediaStatusDomainData microphoneAttributionListData](self, "microphoneAttributionListData");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v4);

  }
}

- (void)removeMicrophoneAttribution:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[STMutableMediaStatusDomainData microphoneAttributionListData](self, "microphoneAttributionListData");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v4);

  }
}

- (void)addMicrophoneRecordingAttribution:(id)a3
{
  id v4;
  STMediaStatusDomainMicrophoneRecordingAttribution *v5;

  if (a3)
  {
    v4 = a3;
    v5 = -[STMediaStatusDomainMicrophoneRecordingAttribution initWithActivityAttribution:]([STMediaStatusDomainMicrophoneRecordingAttribution alloc], "initWithActivityAttribution:", v4);

    -[STMutableMediaStatusDomainData addMicrophoneAttribution:](self, "addMicrophoneAttribution:", v5);
  }
}

- (void)removeMicrophoneRecordingAttribution:(id)a3
{
  id v4;
  STMediaStatusDomainMicrophoneRecordingAttribution *v5;

  if (a3)
  {
    v4 = a3;
    v5 = -[STMediaStatusDomainMicrophoneRecordingAttribution initWithActivityAttribution:]([STMediaStatusDomainMicrophoneRecordingAttribution alloc], "initWithActivityAttribution:", v4);

    -[STMutableMediaStatusDomainData removeMicrophoneAttribution:](self, "removeMicrophoneAttribution:", v5);
  }
}

- (void)addMutedMicrophoneRecordingAttribution:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[STMutableMediaStatusDomainData mutedMicrophoneRecordingAttributionListData](self, "mutedMicrophoneRecordingAttributionListData");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v4);

  }
}

- (void)removeMutedMicrophoneRecordingAttribution:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[STMutableMediaStatusDomainData mutedMicrophoneRecordingAttributionListData](self, "mutedMicrophoneRecordingAttributionListData");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v4);

  }
}

- (void)addSystemAudioRecordingAttribution:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[STMutableMediaStatusDomainData systemAudioRecordingAttributionListData](self, "systemAudioRecordingAttributionListData");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v4);

  }
}

- (void)removeSystemAudioRecordingAttribution:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[STMutableMediaStatusDomainData systemAudioRecordingAttributionListData](self, "systemAudioRecordingAttributionListData");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v4);

  }
}

- (void)addCameraCaptureAttribution:(id)a3
{
  id v4;
  STMediaStatusDomainCameraCaptureAttribution *v5;
  STMediaStatusDomainCameraCaptureAttribution *v6;
  STMediaStatusDomainCameraDescriptor *v7;

  if (a3)
  {
    v4 = a3;
    v5 = [STMediaStatusDomainCameraCaptureAttribution alloc];
    v7 = objc_alloc_init(STMediaStatusDomainCameraDescriptor);
    v6 = -[STMediaStatusDomainCameraCaptureAttribution initWithCameraDescriptor:activityAttribution:](v5, "initWithCameraDescriptor:activityAttribution:", v7, v4);

    -[STMutableMediaStatusDomainData addCameraAttribution:](self, "addCameraAttribution:", v6);
  }
}

- (void)removeCameraCaptureAttribution:(id)a3
{
  id v4;
  STMediaStatusDomainCameraCaptureAttribution *v5;
  STMediaStatusDomainCameraCaptureAttribution *v6;
  STMediaStatusDomainCameraDescriptor *v7;

  if (a3)
  {
    v4 = a3;
    v5 = [STMediaStatusDomainCameraCaptureAttribution alloc];
    v7 = objc_alloc_init(STMediaStatusDomainCameraDescriptor);
    v6 = -[STMediaStatusDomainCameraCaptureAttribution initWithCameraDescriptor:activityAttribution:](v5, "initWithCameraDescriptor:activityAttribution:", v7, v4);

    -[STMutableMediaStatusDomainData removeCameraAttribution:](self, "removeCameraAttribution:", v6);
  }
}

@end
