@implementation NSUserActivity(NSUserActivityPayloadServicesSupport)

- (id)_payloadForIdentifier:()NSUserActivityPayloadServicesSupport
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_internalUserActivity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "payloadForIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_objectForIdentifier:()NSUserActivityPayloadServicesSupport
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_internalUserActivity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_payloadUpdateBlockForIdentifier:()NSUserActivityPayloadServicesSupport
{
  void *v1;
  void *v2;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__NSUserActivity_NSUserActivityPayloadServicesSupport___payloadUpdateBlockForIdentifier___block_invoke;
  aBlock[3] = &unk_1E6007768;
  aBlock[4] = a1;
  v1 = _Block_copy(aBlock);
  v2 = _Block_copy(v1);

  return v2;
}

- (void)_setPayload:()NSUserActivityPayloadServicesSupport object:identifier:
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(a1, "_internalUserActivity");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPayload:object:identifier:", v10, v9, v8);

}

- (void)_setPayload:()NSUserActivityPayloadServicesSupport object:identifier:dirty:
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(a1, "_internalUserActivity");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPayload:object:identifier:dirty:", v12, v11, v10, a6);

}

- (void)_setPayloadIdentifier:()NSUserActivityPayloadServicesSupport object:withBlock:
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, void *, uint64_t, void *);
  void *v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a5;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __95__NSUserActivity_NSUserActivityPayloadServicesSupport___setPayloadIdentifier_object_withBlock___block_invoke;
  v18 = &unk_1E60077B8;
  v19 = v8;
  v20 = v9;
  v10 = v8;
  v11 = v9;
  v12 = a4;
  v13 = _Block_copy(&v15);
  objc_msgSend(a1, "_internalUserActivity", v15, v16, v17, v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPayloadIdentifier:object:withBlock:", v10, v12, v13);

}

- (void)_setDirty:()NSUserActivityPayloadServicesSupport identifier:
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a1, "_internalUserActivity");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDirty:identifier:", a3, v6);

}

@end
