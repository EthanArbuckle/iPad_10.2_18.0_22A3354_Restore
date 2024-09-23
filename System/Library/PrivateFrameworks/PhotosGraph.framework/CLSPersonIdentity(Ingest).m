@implementation CLSPersonIdentity(Ingest)

- (id)locationsByAddressTypes
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__CLSPersonIdentity_Ingest__locationsByAddressTypes__block_invoke;
  v10[3] = &unk_1E842ECF0;
  v11 = v2;
  v4 = v2;
  objc_msgSend(a1, "enumerateAddressesOfType:asCLLocationsWithBlock:", 0, v10);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __52__CLSPersonIdentity_Ingest__locationsByAddressTypes__block_invoke_2;
  v8[3] = &unk_1E842ECF0;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  objc_msgSend(a1, "enumerateAddressesOfType:asCLLocationsWithBlock:", 1, v8);
  v12[0] = &unk_1E84E3008;
  v12[1] = &unk_1E84E3020;
  v13[0] = v4;
  v13[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
