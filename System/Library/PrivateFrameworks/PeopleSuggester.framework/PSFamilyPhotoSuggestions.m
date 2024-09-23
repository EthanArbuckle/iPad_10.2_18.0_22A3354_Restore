@implementation PSFamilyPhotoSuggestions

void __67___PSFamilyPhotoSuggestions_photosRelationshipKnowledgeSuggestions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;

  v5 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67___PSFamilyPhotoSuggestions_photosRelationshipKnowledgeSuggestions__block_invoke_2;
  v8[3] = &unk_1E4401930;
  v6 = *(void **)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  v9 = v6;
  v10 = v5;
  v7 = v5;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v8);

}

void __67___PSFamilyPhotoSuggestions_photosRelationshipKnowledgeSuggestions__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  float v8;
  id v9;

  v9 = a3;
  v5 = a2;
  v6 = (void *)objc_opt_class();
  v7 = objc_msgSend(v5, "unsignedIntegerValue");

  if (objc_msgSend(v6, "_allowRelationship:", v7))
  {
    objc_msgSend(v9, "floatValue");
    if (v8 >= 0.2)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
  }

}

@end
