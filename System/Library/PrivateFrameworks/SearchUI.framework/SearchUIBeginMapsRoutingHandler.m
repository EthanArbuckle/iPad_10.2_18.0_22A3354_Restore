@implementation SearchUIBeginMapsRoutingHandler

- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  unsigned int v17;
  id *v18;
  id v19;
  uint64_t v20;
  void *v21;
  id *v22;
  uint64_t *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id v27;
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "mapsData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CC1828];
    objc_msgSend(v5, "mapsData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mapItemWithSerializedPlaceData:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = objc_alloc(MEMORY[0x1E0C9E3B8]);
    objc_msgSend(v5, "location");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lat");
    v13 = v12;
    objc_msgSend(v5, "location");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lng");
    v8 = (void *)objc_msgSend(v10, "initWithLatitude:longitude:", v13, v15);

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1828]), "initWithCLLocation:", v8);
    objc_msgSend(v5, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setName:", v16);

  }
  v17 = objc_msgSend(v5, "directionsMode") - 1;
  if (v17 > 4)
    v18 = (id *)MEMORY[0x1E0CC1590];
  else
    v18 = (id *)qword_1EA1F8790[v17];
  v19 = *v18;
  if ((objc_msgSend(v5, "shouldSearchDirectionsAlongCurrentRoute") & 1) != 0)
  {
    v20 = *MEMORY[0x1E0CC15D8];
    v28[0] = *MEMORY[0x1E0CC1A80];
    v28[1] = v20;
    v29[0] = MEMORY[0x1E0C9AAB0];
    v29[1] = &unk_1EA228DC8;
    v21 = (void *)MEMORY[0x1E0C99D80];
    v22 = (id *)v29;
    v23 = v28;
    v24 = 2;
  }
  else
  {
    v26 = *MEMORY[0x1E0CC1598];
    v27 = v19;
    v21 = (void *)MEMORY[0x1E0C99D80];
    v22 = &v27;
    v23 = &v26;
    v24 = 1;
  }
  objc_msgSend(v21, "dictionaryWithObjects:forKeys:count:", v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "openInMapsWithLaunchOptions:completionHandler:", v25, 0);

}

- (id)defaultSymbolName
{
  void *v2;
  __CFString *v3;
  __CFString *v4;

  -[SearchUICommandHandler command](self, "command");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "shouldSearchDirectionsAlongCurrentRoute"))
    v3 = CFSTR("plus.circle");
  else
    v3 = CFSTR("arrow.triangle.turn.up.right.circle");
  v4 = v3;

  return v4;
}

@end
