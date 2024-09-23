@implementation NSCoder(ICUserIdentity)

- (void)ic_encodeUserIdentity:()ICUserIdentity withStore:forKey:
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__NSCoder_ICUserIdentity__ic_encodeUserIdentity_withStore_forKey___block_invoke;
  v12[3] = &unk_1E4391230;
  v12[4] = a1;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  objc_msgSend(v11, "_performEncodingTaskUsingSpecificIdentityStore:encodingHandler:", a4, v12);

}

@end
