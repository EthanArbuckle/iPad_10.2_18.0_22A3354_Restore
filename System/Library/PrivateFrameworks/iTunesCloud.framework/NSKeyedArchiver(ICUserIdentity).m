@implementation NSKeyedArchiver(ICUserIdentity)

+ (id)ic_archivedDataWithRootUserIdentity:()ICUserIdentity inStore:requiringSecureCoding:error:
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v10 = a3;
  v11 = a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__4671;
  v31 = __Block_byref_object_dispose__4672;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__4671;
  v25 = __Block_byref_object_dispose__4672;
  v26 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __107__NSKeyedArchiver_ICUserIdentity__ic_archivedDataWithRootUserIdentity_inStore_requiringSecureCoding_error___block_invoke;
  v15[3] = &unk_1E438A810;
  v17 = &v27;
  v19 = a1;
  v12 = v10;
  v20 = a5;
  v16 = v12;
  v18 = &v21;
  objc_msgSend(v12, "_performEncodingTaskUsingSpecificIdentityStore:encodingHandler:", v11, v15);
  if (a6)
    *a6 = objc_retainAutorelease((id)v22[5]);
  v13 = (id)v28[5];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v13;
}

@end
