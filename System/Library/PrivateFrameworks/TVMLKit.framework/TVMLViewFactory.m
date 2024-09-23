@implementation TVMLViewFactory

- (TVMLViewFactory)init
{
  TVMLViewFactory *v2;
  TVMLViewFactory *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TVMLViewFactory;
  v2 = -[TVMLViewFactory init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[TVMLViewFactory _registerViewCreators](v2, "_registerViewCreators");
  return v3;
}

- (void)_registerViewCreators
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[4];
  id v55;
  _QWORD v56[4];
  id v57;
  _QWORD v58[4];
  id v59;
  _QWORD v60[4];
  id v61;
  _QWORD v62[4];
  id v63;
  _QWORD v64[4];
  id v65;
  _QWORD v66[4];
  id v67;
  _QWORD v68[4];
  id v69;
  _QWORD v70[4];
  id v71;
  _QWORD v72[4];
  id v73;
  _QWORD v74[4];
  id v75;
  _QWORD v76[4];
  id v77;
  _QWORD v78[4];
  id v79;
  _QWORD v80[4];
  id v81;
  id location[2];

  objc_initWeak(location, self);
  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v80[0] = MEMORY[0x24BDAC760];
  v80[1] = 3221225472;
  v80[2] = __40__TVMLViewFactory__registerViewCreators__block_invoke;
  v80[3] = &unk_24EB879C0;
  objc_copyWeak(&v81, location);
  objc_msgSend(v2, "_registerViewCreator:withType:", v80, 55);

  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v78[0] = v3;
  v78[1] = 3221225472;
  v78[2] = __40__TVMLViewFactory__registerViewCreators__block_invoke_2;
  v78[3] = &unk_24EB879C0;
  objc_copyWeak(&v79, location);
  objc_msgSend(v4, "_registerViewCreator:withType:", v78, 33);

  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v76[0] = v3;
  v76[1] = 3221225472;
  v76[2] = __40__TVMLViewFactory__registerViewCreators__block_invoke_3;
  v76[3] = &unk_24EB879C0;
  objc_copyWeak(&v77, location);
  objc_msgSend(v5, "_registerViewCreator:withType:", v76, 15);

  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v74[0] = v3;
  v74[1] = 3221225472;
  v74[2] = __40__TVMLViewFactory__registerViewCreators__block_invoke_4;
  v74[3] = &unk_24EB879C0;
  objc_copyWeak(&v75, location);
  objc_msgSend(v6, "_registerViewCreator:withType:", v74, 23);

  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v72[0] = v3;
  v72[1] = 3221225472;
  v72[2] = __40__TVMLViewFactory__registerViewCreators__block_invoke_5;
  v72[3] = &unk_24EB879C0;
  objc_copyWeak(&v73, location);
  objc_msgSend(v7, "_registerViewCreator:withType:", v72, 34);

  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v70[0] = v3;
  v70[1] = 3221225472;
  v70[2] = __40__TVMLViewFactory__registerViewCreators__block_invoke_6;
  v70[3] = &unk_24EB879C0;
  objc_copyWeak(&v71, location);
  objc_msgSend(v8, "_registerViewCreator:withType:", v70, 35);

  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v68[0] = v3;
  v68[1] = 3221225472;
  v68[2] = __40__TVMLViewFactory__registerViewCreators__block_invoke_7;
  v68[3] = &unk_24EB879C0;
  objc_copyWeak(&v69, location);
  objc_msgSend(v9, "_registerViewCreator:withType:", v68, 12);

  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v3;
  v66[1] = 3221225472;
  v66[2] = __40__TVMLViewFactory__registerViewCreators__block_invoke_8;
  v66[3] = &unk_24EB879C0;
  objc_copyWeak(&v67, location);
  objc_msgSend(v10, "_registerViewCreator:withType:", v66, 59);

  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_registerViewCreator:withType:", &__block_literal_global_39, 19);

  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_registerViewCreator:withType:", &__block_literal_global_201, 20);

  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_registerViewCreator:withType:", &__block_literal_global_203, 18);

  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = v3;
  v64[1] = 3221225472;
  v64[2] = __40__TVMLViewFactory__registerViewCreators__block_invoke_12;
  v64[3] = &unk_24EB879C0;
  objc_copyWeak(&v65, location);
  objc_msgSend(v14, "_registerViewCreator:withType:", v64, 13);

  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = v3;
  v62[1] = 3221225472;
  v62[2] = __40__TVMLViewFactory__registerViewCreators__block_invoke_13;
  v62[3] = &unk_24EB879C0;
  objc_copyWeak(&v63, location);
  objc_msgSend(v15, "_registerViewCreator:withType:", v62, 1);

  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = v3;
  v60[1] = 3221225472;
  v60[2] = __40__TVMLViewFactory__registerViewCreators__block_invoke_14;
  v60[3] = &unk_24EB87A68;
  objc_copyWeak(&v61, location);
  objc_msgSend(v16, "_registerViewCreatorEx:withType:", v60, 16);

  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = v3;
  v58[1] = 3221225472;
  v58[2] = __40__TVMLViewFactory__registerViewCreators__block_invoke_15;
  v58[3] = &unk_24EB87A68;
  objc_copyWeak(&v59, location);
  objc_msgSend(v17, "_registerViewCreatorEx:withType:", v58, 30);

  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v3;
  v56[1] = 3221225472;
  v56[2] = __40__TVMLViewFactory__registerViewCreators__block_invoke_16;
  v56[3] = &unk_24EB879C0;
  objc_copyWeak(&v57, location);
  objc_msgSend(v18, "_registerViewCreator:withType:", v56, 5);

  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v3;
  v54[1] = 3221225472;
  v54[2] = __40__TVMLViewFactory__registerViewCreators__block_invoke_17;
  v54[3] = &unk_24EB879C0;
  objc_copyWeak(&v55, location);
  objc_msgSend(v19, "_registerViewCreator:withType:", v54, 44);

  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v3;
  v52[1] = 3221225472;
  v52[2] = __40__TVMLViewFactory__registerViewCreators__block_invoke_18;
  v52[3] = &unk_24EB879C0;
  objc_copyWeak(&v53, location);
  objc_msgSend(v20, "_registerViewCreator:withType:", v52, 6);

  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v3;
  v50[1] = 3221225472;
  v50[2] = __40__TVMLViewFactory__registerViewCreators__block_invoke_19;
  v50[3] = &unk_24EB879C0;
  objc_copyWeak(&v51, location);
  objc_msgSend(v21, "_registerViewCreator:withType:", v50, 7);

  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v3;
  v48[1] = 3221225472;
  v48[2] = __40__TVMLViewFactory__registerViewCreators__block_invoke_20;
  v48[3] = &unk_24EB879C0;
  objc_copyWeak(&v49, location);
  objc_msgSend(v22, "_registerViewCreator:withType:", v48, 50);

  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_registerViewCreator:withType:", &__block_literal_global_206, 38);

  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "_registerViewCreator:withType:", &__block_literal_global_208, 54);

  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v3;
  v46[1] = 3221225472;
  v46[2] = __40__TVMLViewFactory__registerViewCreators__block_invoke_23;
  v46[3] = &unk_24EB879C0;
  objc_copyWeak(&v47, location);
  objc_msgSend(v25, "_registerViewCreator:withType:", v46, 8);

  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v3;
  v44[1] = 3221225472;
  v44[2] = __40__TVMLViewFactory__registerViewCreators__block_invoke_24;
  v44[3] = &unk_24EB879C0;
  objc_copyWeak(&v45, location);
  objc_msgSend(v26, "_registerViewCreator:withType:", v44, 41);

  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "_registerViewCreator:withType:", &__block_literal_global_210, 85);

  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v3;
  v42[1] = 3221225472;
  v42[2] = __40__TVMLViewFactory__registerViewCreators__block_invoke_26;
  v42[3] = &unk_24EB879C0;
  objc_copyWeak(&v43, location);
  objc_msgSend(v28, "_registerViewCreator:withType:", v42, 39);

  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v3;
  v40[1] = 3221225472;
  v40[2] = __40__TVMLViewFactory__registerViewCreators__block_invoke_27;
  v40[3] = &unk_24EB879C0;
  objc_copyWeak(&v41, location);
  objc_msgSend(v29, "_registerViewCreator:withType:", v40, 21);

  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v3;
  v38[1] = 3221225472;
  v38[2] = __40__TVMLViewFactory__registerViewCreators__block_invoke_28;
  v38[3] = &unk_24EB879C0;
  objc_copyWeak(&v39, location);
  objc_msgSend(v30, "_registerViewCreator:withType:", v38, 52);

  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "_registerViewCreator:withType:", &__block_literal_global_212, 56);

  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v3;
  v36[1] = 3221225472;
  v36[2] = __40__TVMLViewFactory__registerViewCreators__block_invoke_30;
  v36[3] = &unk_24EB879C0;
  objc_copyWeak(&v37, location);
  objc_msgSend(v32, "_registerViewCreator:withType:", v36, 48);

  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v3;
  v34[1] = 3221225472;
  v34[2] = __40__TVMLViewFactory__registerViewCreators__block_invoke_31;
  v34[3] = &unk_24EB879C0;
  objc_copyWeak(&v35, location);
  objc_msgSend(v33, "_registerViewCreator:withType:", v34, 80);

  objc_destroyWeak(&v35);
  objc_destroyWeak(&v37);
  objc_destroyWeak(&v39);
  objc_destroyWeak(&v41);
  objc_destroyWeak(&v43);
  objc_destroyWeak(&v45);
  objc_destroyWeak(&v47);
  objc_destroyWeak(&v49);
  objc_destroyWeak(&v51);
  objc_destroyWeak(&v53);
  objc_destroyWeak(&v55);
  objc_destroyWeak(&v57);
  objc_destroyWeak(&v59);
  objc_destroyWeak(&v61);
  objc_destroyWeak(&v63);
  objc_destroyWeak(&v65);
  objc_destroyWeak(&v67);
  objc_destroyWeak(&v69);
  objc_destroyWeak(&v71);
  objc_destroyWeak(&v73);
  objc_destroyWeak(&v75);
  objc_destroyWeak(&v77);
  objc_destroyWeak(&v79);
  objc_destroyWeak(&v81);
  objc_destroyWeak(location);
}

id __40__TVMLViewFactory__registerViewCreators__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  void *v8;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_textViewWithElement:existingView:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __40__TVMLViewFactory__registerViewCreators__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  void *v8;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_labelViewForElement:existingView:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __40__TVMLViewFactory__registerViewCreators__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id WeakRetained;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "parent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "tv_elementType") == 20)
  {

  }
  else
  {
    objc_msgSend(v5, "parent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "tv_elementType");

    if (v9 != 19)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      objc_msgSend(WeakRetained, "_organizerViewForElement:existingView:", v5, v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
  }
  +[_TVInfoHeaderView infoHeaderViewWithElement:existingView:](_TVInfoHeaderView, "infoHeaderViewWithElement:existingView:", v5, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v10;
}

id __40__TVMLViewFactory__registerViewCreators__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  void *v8;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_listItemLockupWithElement:existingView:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __40__TVMLViewFactory__registerViewCreators__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  void *v8;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_organizerViewForElement:existingView:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __40__TVMLViewFactory__registerViewCreators__block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  void *v8;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_organizerViewForElement:existingView:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __40__TVMLViewFactory__registerViewCreators__block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_organizerViewForElement:existingView:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "containerGuide");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", 1);

  objc_msgSend(v6, "style");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "tv_backgroundColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "color");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v8, "setBackgroundColor:", v12);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v13);

  }
  return v8;
}

id __40__TVMLViewFactory__registerViewCreators__block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  void *v8;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_organizerViewForElement:existingView:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

_TVInfoListView *__40__TVMLViewFactory__registerViewCreators__block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[_TVInfoListView infoListViewWithElement:existingView:](_TVInfoListView, "infoListViewWithElement:existingView:", a2, a3);
}

_TVInfoTableView *__40__TVMLViewFactory__registerViewCreators__block_invoke_10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[_TVInfoTableView infoTableViewWithElement:existingView:](_TVInfoTableView, "infoTableViewWithElement:existingView:", a2, a3);
}

_TVInfoCellView *__40__TVMLViewFactory__registerViewCreators__block_invoke_11(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[_TVInfoCellView infoCellViewWithElement:existingView:](_TVInfoCellView, "infoCellViewWithElement:existingView:", a2, a3);
}

id __40__TVMLViewFactory__registerViewCreators__block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id WeakRetained;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "parent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "tv_elementType") == 20)
  {

  }
  else
  {
    objc_msgSend(v5, "parent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "tv_elementType");

    if (v9 != 19)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      objc_msgSend(WeakRetained, "_organizerViewForElement:existingView:", v5, v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
  }
  +[_TVInfoHeaderView infoHeaderViewWithElement:existingView:](_TVInfoHeaderView, "infoHeaderViewWithElement:existingView:", v5, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v10;
}

id __40__TVMLViewFactory__registerViewCreators__block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  void *v8;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_activityIndicatorViewForElement:existingView:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __40__TVMLViewFactory__registerViewCreators__block_invoke_14(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "_imageViewForElement:layout:existingView:", v9, v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __40__TVMLViewFactory__registerViewCreators__block_invoke_15(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "_monogramViewForElement:layout:existingView:", v9, v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __40__TVMLViewFactory__registerViewCreators__block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  void *v8;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_imageViewForBadgeElement:existingView:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __40__TVMLViewFactory__registerViewCreators__block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  void *v8;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_rowViewForElement:existingView:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __40__TVMLViewFactory__registerViewCreators__block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  void *v8;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_buttonForElement:existingView:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __40__TVMLViewFactory__registerViewCreators__block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  void *v8;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_buttonLockupForElement:existingView:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __40__TVMLViewFactory__registerViewCreators__block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  void *v8;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_segmentedControlForElement:existingView:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

_TVProductInfoView *__40__TVMLViewFactory__registerViewCreators__block_invoke_21(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[_TVProductInfoView productInfoViewWithElement:existingView:](_TVProductInfoView, "productInfoViewWithElement:existingView:", a2, a3);
}

_TVProductStackView *__40__TVMLViewFactory__registerViewCreators__block_invoke_22(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[_TVProductStackView productStackViewWithElement:existingView:](_TVProductStackView, "productStackViewWithElement:existingView:", a2, a3);
}

id __40__TVMLViewFactory__registerViewCreators__block_invoke_23(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  void *v8;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_cardViewFromElement:existingView:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __40__TVMLViewFactory__registerViewCreators__block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  void *v8;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_ratingBadgeFromElement:existingView:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __40__TVMLViewFactory__registerViewCreators__block_invoke_25(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[_TVStarHistogram histogramViewWithElement:existingView:](_TVStarHistogram, "histogramViewWithElement:existingView:", a2, a3);
}

id __40__TVMLViewFactory__registerViewCreators__block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  void *v8;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_progressBarFromElement:existingView:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __40__TVMLViewFactory__registerViewCreators__block_invoke_27(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  void *v8;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_organizerViewForElement:existingView:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __40__TVMLViewFactory__registerViewCreators__block_invoke_28(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  void *v8;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_separatorViewForElement:existingView:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __40__TVMLViewFactory__registerViewCreators__block_invoke_29(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[_TVTextBadge textBadgeViewWithElement:existingView:](_TVTextBadge, "textBadgeViewWithElement:existingView:", a2, a3);
}

id __40__TVMLViewFactory__registerViewCreators__block_invoke_30(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  void *v8;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_seasonsBadgeWithElement:existingView:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __40__TVMLViewFactory__registerViewCreators__block_invoke_31(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  void *v8;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_loadingImageViewForElement:existingView:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)organizerViewWithElements:(id)a3 existingView:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "_organizerViewWithElement:elements:existingView:", 0, v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_organizerViewWithElement:(id)a3 elements:(id)a4 existingView:(id)a5
{
  id v7;
  id v8;
  _TVOrganizerView *v9;
  _TVOrganizerView *v10;
  _TVOrganizerView *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  _TVOrganizerView *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  int64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  int64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  _TVOrganizerView *v65;
  id v67;
  void *v68;
  void *v69;
  id v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void (**v74)(_QWORD, _QWORD, _QWORD);
  id obj;
  uint64_t v76;
  uint64_t v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _QWORD v88[4];
  id v89;
  _BYTE v90[128];
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x24BDAC8D0];
  v70 = a3;
  v7 = a4;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = (_TVOrganizerView *)v8;
  }
  else
  {
    v10 = [_TVOrganizerView alloc];
    v9 = -[_TVOrganizerView initWithFrame:](v10, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  }
  v11 = v9;
  v77 = objc_msgSend(v70, "tv_semanticContentAttribute");
  -[_TVOrganizerView setSemanticContentAttribute:](v11, "setSemanticContentAttribute:");
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v7;
  if (v70)
  {
    objc_msgSend(v70, "children");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = v7;
  }
  v13 = v12;
  v68 = v8;
  objc_msgSend(v8, "components");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  v88[0] = MEMORY[0x24BDAC760];
  v88[1] = 3221225472;
  v88[2] = __67__TVMLViewFactory__organizerViewWithElement_elements_existingView___block_invoke;
  v88[3] = &unk_24EB87B38;
  v67 = v15;
  v89 = v67;
  v74 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x22767F470](v88);
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  obj = v13;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v91, 16);
  if (v16)
  {
    v17 = v16;
    v18 = 0;
    v19 = *(_QWORD *)v85;
    v71 = *(_QWORD *)v85;
    do
    {
      v20 = 0;
      v73 = v17;
      do
      {
        if (*(_QWORD *)v85 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * v20);
        if (objc_msgSend(v21, "tv_elementType") == 4)
        {
          v82 = 0u;
          v83 = 0u;
          v80 = 0u;
          v81 = 0u;
          objc_msgSend(v21, "children");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v80, v90, 16);
          if (v23)
          {
            v24 = v23;
            v76 = v20;
            v25 = *(_QWORD *)v81;
            do
            {
              for (i = 0; i != v24; ++i)
              {
                if (*(_QWORD *)v81 != v25)
                  objc_enumerationMutation(v22);
                v27 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
                if (objc_msgSend(v27, "tv_elementType") == 16 && !objc_msgSend(v27, "tv_imageType"))
                {
                  v28 = v11;
                  -[_TVOrganizerView backgroundImageView](v11, "backgroundImageView");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v30, "_viewFromElement:existingView:", v27, v29);
                  v31 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v27, "attributes");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("contentsMode"));
                  v33 = (void *)objc_claimAutoreleasedReturnValue();

                  if (objc_msgSend(v33, "length"))
                  {
                    v34 = objc_msgSend(v27, "tv_scaleMode");
                    v35 = 4;
                    if (v34 != 4)
                      v35 = 5;
                    if (v34 == 3)
                      v35 = 2;
                    if ((unint64_t)(v34 - 1) >= 2)
                      v36 = v35;
                    else
                      v36 = 1;
                  }
                  else
                  {
                    objc_msgSend(v27, "style");
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    v38 = objc_msgSend(v37, "tv_position");

                    v36 = +[TVMLUtilities contentModeForPosition:defaultMode:](TVMLUtilities, "contentModeForPosition:defaultMode:", +[TVMLUtilities semanticPositionForPosition:semanticContentAttribute:](TVMLUtilities, "semanticPositionForPosition:semanticContentAttribute:", v38, v77), 5);
                  }
                  objc_msgSend(v31, "setContentMode:", v36);

                  v18 = v31;
                  v11 = v28;
                }
              }
              v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v80, v90, 16);
            }
            while (v24);
            v19 = v71;
            v17 = v73;
            v20 = v76;
          }
        }
        else
        {
          v39 = objc_msgSend(v21, "tv_elementType");
          objc_msgSend(v21, "elementName");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, uint64_t, void *))v74)[2](v74, v39, v40);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "_viewFromElement:existingView:", v21, v22);
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          if (v42)
          {
            if (objc_msgSend(v21, "isDisabled")
              && objc_msgSend(v70, "tv_elementType") == 23
              && objc_msgSend(v21, "tv_elementType") == 55
              && (objc_msgSend(v21, "tv_textStyle") == 1 || objc_msgSend(v21, "tv_textStyle") == 2))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v43 = v42;
                objc_msgSend(v43, "textColor");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "colorWithAlphaComponent:", 0.4);
                v45 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v43, "setTextColor:", v45);
              }
            }
            objc_msgSend(v42, "setSemanticContentAttribute:", v77);
            objc_msgSend(v72, "addObject:", v42);
          }

        }
        ++v20;
      }
      while (v20 != v17);
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v91, 16);
    }
    while (v17);
  }
  else
  {
    v18 = 0;
  }

  -[_TVOrganizerView setBackgroundImageView:](v11, "setBackgroundImageView:", v18);
  -[_TVOrganizerView setComponents:](v11, "setComponents:", v72);
  v78 = TVCornerRadiiZero;
  v79 = *(_OWORD *)&qword_222E77538;
  if (+[TVMLUtilities _cornerRadiiFromElement:cornerRadii:circle:](TVMLUtilities, "_cornerRadiiFromElement:cornerRadii:circle:", v70, &v78, 0))
  {
    +[TVCornerUtilities radiusFromCornerRadii:](TVCornerUtilities, "radiusFromCornerRadii:", v78, v79);
    -[_TVOrganizerView _setContinuousCornerRadius:](v11, "_setContinuousCornerRadius:");
    -[_TVOrganizerView setClipsToBounds:](v11, "setClipsToBounds:", 1);
  }
  objc_msgSend(v70, "style");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "tv_imageTreatment");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "isEqualToString:", CFSTR("blur"));

  if (v48)
  {
    objc_msgSend(v70, "appDocument");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "templateElement");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = +[TVMLUtilities interfaceStyleForTemplateElement:](TVMLUtilities, "interfaceStyleForTemplateElement:", v50);

    if (v51 == 1)
      v52 = 4005;
    else
      v52 = 4000;
    objc_msgSend(MEMORY[0x24BDF6878], "effectWithStyle:", v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6FC8]), "initWithEffect:", v53);
    -[_TVOrganizerView setBackgroundImageView:](v11, "setBackgroundImageView:", v54);

  }
  objc_msgSend(v70, "style");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "tv_columnColor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    -[_TVOrganizerView setColumnDividersEnabled:](v11, "setColumnDividersEnabled:", 1);
    objc_msgSend(v70, "style");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "tv_columnColor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "color");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVOrganizerView setColumnDividerColor:](v11, "setColumnDividerColor:", v59);

    objc_msgSend(v70, "style");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "tv_columnPadding");
    -[_TVOrganizerView setColumnDividerPadding:](v11, "setColumnDividerPadding:");

  }
  else
  {
    -[_TVOrganizerView setColumnDividersEnabled:](v11, "setColumnDividersEnabled:", 0);
  }
  objc_msgSend(v70, "attributes");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "objectForKey:", CFSTR("remembersFocus"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (v62)
  {
    objc_msgSend(v70, "attributes");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "objectForKey:", CFSTR("remembersFocus"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVOrganizerView setRemembersLastFocusedItem:](v11, "setRemembersLastFocusedItem:", objc_msgSend(v64, "BOOLValue"));

  }
  if (v70)
    -[UIView transferLayoutStylesFromElement:](v11, "transferLayoutStylesFromElement:", v70);
  v65 = v11;

  return v65;
}

id __67__TVMLViewFactory__organizerViewWithElement_elements_existingView___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0x7FFFFFFFFFFFFFFFLL;
  v6 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __67__TVMLViewFactory__organizerViewWithElement_elements_existingView___block_invoke_2;
  v10[3] = &unk_24EB87B10;
  v13 = a2;
  v7 = v5;
  v11 = v7;
  v12 = &v14;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);
  if (v15[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "removeObjectAtIndex:", v15[3]);
  }

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __67__TVMLViewFactory__organizerViewWithElement_elements_existingView___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  v7 = objc_msgSend(v10, "tv_elementType");
  if (v7 == a1[6])
  {
    if (v7 != 55
      || (objc_msgSend(v10, "tv_elementName"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "isEqualToString:", a1[4]),
          v8,
          v9))
    {
      *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a3;
      *a4 = 1;
    }
  }

}

+ (id)imageStackViewWithElement:(id)a3 layout:(id)a4 existingView:(id)a5
{
  id v7;
  TVImageLayout *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  TVImageLayout *v15;
  void *v16;
  void *v17;
  void *v18;
  TVImageDescription *v19;
  void *v20;
  void *v21;

  v7 = a3;
  v8 = (TVImageLayout *)a4;
  v9 = a5;
  if (objc_msgSend(v7, "tv_elementType") == 16)
  {
    v10 = v7;
    v11 = objc_msgSend(v10, "tv_imageType");
    if (v11 != 3 && v11)
    {
      v13 = 0;
    }
    else
    {
      objc_msgSend(v9, "tv_associatedIKViewElement");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (v12 != v10)
      {

LABEL_10:
        if (!v8)
        {
          v8 = objc_alloc_init(TVImageLayout);
          -[TVViewLayout setAcceptsFocus:](v8, "setAcceptsFocus:", 1);
        }
        v15 = v8;
        +[TVImageLayout layoutWithLayout:element:](TVImageLayout, "layoutWithLayout:element:", v8, v10);
        v8 = (TVImageLayout *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "tv_imageProxyWithLayout:", v8);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "appDocument");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "requestLoader");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setRequestLoader:", v18);

        }
        v19 = objc_alloc_init(TVImageDescription);
        -[TVImageDescription setImageProxy:](v19, "setImageProxy:", v16);
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("TVConfigureForMetrics"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVImageDescription setConfigureForMetrics:](v19, "setConfigureForMetrics:", objc_msgSend(v20, "BOOLValue"));

        -[TVImageDescription configureForMetrics](v19, "configureForMetrics");
        +[TVMLUtilities _placeholderImageForViewElement:imageLayout:](TVMLUtilities, "_placeholderImageForViewElement:imageLayout:", v10, v8);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVImageDescription setPlaceholderImage:](v19, "setPlaceholderImage:", v21);

        +[TVViewFactory imageStackViewWithDescription:layout:existingView:](TVViewFactory, "imageStackViewWithDescription:layout:existingView:", v19, v8, v9);
        v13 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_15;
      }
      v14 = objc_msgSend(v10, "updateType");

      if (v14 != 2)
        goto LABEL_10;
      v13 = v9;
    }
LABEL_15:

    goto LABEL_16;
  }
  v13 = 0;
LABEL_16:

  return v13;
}

+ (id)imageStackViewWithElement:(id)a3 existingView:(id)a4
{
  return (id)objc_msgSend(a1, "imageStackViewWithElement:layout:existingView:", a3, 0, a4);
}

+ (id)imageViewWithElement:(id)a3 layout:(id)a4 existingView:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  uint64_t v20;
  TVImageDescription *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  int v45;
  id v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  int v53;
  void *v54;
  int v55;
  id v56;
  void *v58;
  void *v59;
  void *v60;
  void *v61;

  v7 = a3;
  v8 = a5;
  v9 = v7;
  +[TVImageLayout layoutWithLayout:element:](TVImageLayout, "layoutWithLayout:element:", a4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tv_urlWithLayout:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "tv_imageURLType") == 1)
  {
    +[TVMLViewFactory imageStackViewWithElement:layout:existingView:](TVMLViewFactory, "imageStackViewWithElement:layout:existingView:", v9, v10, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_43;
  }
  objc_msgSend(v10, "decoratorSize");
  if (v14 < 0.00000011920929 || v13 < 0.00000011920929)
  {
    objc_msgSend(v9, "url");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "tv_isResourceURL"))
    {

    }
    else
    {
      objc_msgSend(v9, "url");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "tv_isSymbolURL");

      if ((v18 & 1) == 0)
      {
        v27 = (void *)TVMLKitLogObject;
        if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_ERROR))
          +[TVMLViewFactory imageViewWithElement:layout:existingView:].cold.1(v27, v9);
        v12 = 0;
        goto LABEL_43;
      }
    }
  }
  objc_msgSend(v9, "appDocument");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "templateElement");
  v20 = objc_claimAutoreleasedReturnValue();

  v21 = objc_alloc_init(TVImageDescription);
  objc_msgSend(v9, "tv_imageProxyWithLayout:", v10);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVImageDescription setImageProxy:](v21, "setImageProxy:", v22);
  objc_msgSend(v9, "style");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "valueForStyle:", CFSTR("tv-placeholder"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v60 = v24;
  v61 = (void *)v20;
  if ((objc_msgSend(v9, "tv_isResource") & 1) != 0 || (objc_msgSend(v9, "tv_isSymbol") & 1) != 0)
    goto LABEL_13;
  if (!objc_msgSend(v24, "length"))
  {
    objc_msgSend(v10, "placeholderArtworkName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {

    }
    else
    {
      objc_msgSend(v9, "parent");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "tv_elementType");

      if (v29 != 24)
      {
LABEL_13:
        v25 = 0;
        goto LABEL_22;
      }
    }
  }
  objc_msgSend(v10, "borderRadii");
  +[TVMLUtilities _placeholderImageForViewElement:withImageLayout:cornerRadii:andScaledSize:](TVMLUtilities, "_placeholderImageForViewElement:withImageLayout:cornerRadii:andScaledSize:", v9, v10);
  v25 = objc_claimAutoreleasedReturnValue();
LABEL_22:
  v59 = (void *)v25;
  -[TVImageDescription setPlaceholderImage:](v21, "setPlaceholderImage:", v25);
  -[TVImageDescription setSemanticContentAttribute:](v21, "setSemanticContentAttribute:", objc_msgSend(v9, "tv_semanticContentAttribute"));
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("TVConfigureForMetrics"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVImageDescription setConfigureForMetrics:](v21, "setConfigureForMetrics:", objc_msgSend(v30, "BOOLValue"));

  objc_msgSend(v9, "attributes");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("accessibilityText"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVImageDescription setAccessibilityText:](v21, "setAccessibilityText:", v32);

  objc_msgSend(v9, "attributes");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("data-siri"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVImageDescription setSiriData:](v21, "setSiriData:", v34);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "appDocument");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "requestLoader");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setRequestLoader:", v36);

    objc_msgSend(v9, "parent");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v37, "tv_elementType") == 4)
    {
      objc_msgSend(v9, "parent");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "parent");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "tv_elementType");

      if (v40 == 12)
      {
        -[TVImageDescription setIsInBackgroundOrBanner:](v21, "setIsInBackgroundOrBanner:", 1);
        goto LABEL_29;
      }
    }
    else
    {

    }
    objc_msgSend(v9, "style");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "tv_tintColor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "gradientType");

    if (v43)
      -[TVImageDescription setHasGradient:](v21, "setHasGradient:", 1);
  }
LABEL_29:
  +[TVViewFactory imageViewWithDescription:layout:existingView:](TVViewFactory, "imageViewWithDescription:layout:existingView:", v21, v10, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "imageProxy");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "isEqual:", v22);

  if (v12)
  {
    v58 = v11;
    v46 = v8;
    objc_msgSend(v9, "attributes");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("handlesInteraction"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "BOOLValue");

    objc_msgSend(v12, "setUserInteractionEnabled:", v49);
    +[_TVControlTarget addTargetInControl:withViewElement:](_TVControlTarget, "addTargetInControl:withViewElement:", v12, v9);
    objc_msgSend(v9, "parent");
    v50 = objc_claimAutoreleasedReturnValue();
    if (v50)
    {
      v51 = (void *)v50;
      while (objc_msgSend(v51, "tv_elementType") != 35)
      {
        objc_msgSend(v51, "parent");
        v52 = objc_claimAutoreleasedReturnValue();

        v51 = (void *)v52;
        if (!v52)
          goto LABEL_34;
      }
      objc_msgSend(v12, "_loadImage");

      v8 = v46;
    }
    else
    {
LABEL_34:
      v8 = v46;
      if (v46)
        v53 = v45;
      else
        v53 = 0;
      if (v53 == 1)
      {
        objc_msgSend(v9, "url");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = objc_msgSend(v54, "tv_isResourceURL");

        v8 = v46;
        if (v55)
          objc_msgSend(v12, "_reloadImageForLayoutDirectionChange");
      }
    }
    v56 = v12;

    v11 = v58;
  }

LABEL_43:
  return v12;
}

+ (id)imageViewWithElement:(id)a3 existingView:(id)a4
{
  return (id)objc_msgSend(a1, "imageViewWithElement:layout:existingView:", a3, 0, a4);
}

- (id)_textViewWithElement:(id)a3 existingView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int v21;
  int v22;
  void *v23;
  void *v24;
  uint64_t v25;
  TVMLViewFactory *v26;
  uint64_t v27;
  void *v28;
  TVMLViewFactory *v30;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "attributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("handlesOverflow"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = self;
  if ((objc_msgSend(v9, "BOOLValue") & 1) != 0)
  {
    v10 = 1;
  }
  else
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("allowsZooming"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "BOOLValue");

  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("handlesOverflow"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("handlesOverflow"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lowercaseString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("always"));
  objc_msgSend(v6, "parent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "tv_elementType") == 15)
  {
    objc_msgSend(v6, "parent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "parent");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "tv_elementType");

    if (v19 != 18)
    {
      v21 = 0;
      goto LABEL_13;
    }
    objc_msgSend(v6, "text");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "string");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "containsString:", CFSTR("\r"));

  }
  else
  {
    v21 = 0;
  }

LABEL_13:
  v22 = v15 | v10;
  if (objc_msgSend(v6, "tv_textStyle") == 3)
  {
    objc_msgSend(v6, "appDocument");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "templateElement");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "tv_elementType");

    if (v25 == 62)
    {
      v26 = v30;
      if (!v22)
      {
        -[TVMLViewFactory _textBoxViewForElement:existingView:](v30, "_textBoxViewForElement:existingView:", v6, v7);
        v27 = objc_claimAutoreleasedReturnValue();
        goto LABEL_24;
      }
LABEL_19:
      -[TVMLViewFactory _zoomableTextViewFromElement:alwaysFocusable:existingView:](v26, "_zoomableTextViewFromElement:alwaysFocusable:existingView:", v6, v15, v7);
      v27 = objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
  }
  if (v22)
  {
    v26 = v30;
    goto LABEL_19;
  }
  if (v21)
    -[TVMLViewFactory _headerColumnViewForElement:existingView:](v30, "_headerColumnViewForElement:existingView:", v6, v7);
  else
    -[TVMLViewFactory _labelViewForElement:existingView:](v30, "_labelViewForElement:existingView:", v6, v7);
  v27 = objc_claimAutoreleasedReturnValue();
LABEL_24:
  v28 = (void *)v27;

  return v28;
}

- (id)_listItemLockupWithElement:(id)a3 existingView:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v32;
  __int128 v33;
  CGAffineTransform v34;
  CGAffineTransform v35;

  v6 = a3;
  -[TVMLViewFactory _organizerViewForElement:existingView:](self, "_organizerViewForElement:existingView:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    objc_msgSend(v8, "setDisabled:", objc_msgSend(v6, "isDisabled"));
    objc_msgSend(v8, "setClipsToBounds:", 0);
    objc_msgSend(v6, "style");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tv_backgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "color");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:forState:", v11, 0);

    objc_msgSend(v6, "style");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "tv_highlightColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "color");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:forState:", v14, 8);

    objc_msgSend(v6, "style");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "tv_highlightColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "color");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:forState:", v17, 1);

    objc_msgSend(v8, "floatingView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFocusedSizeIncrease:", 30.0);

    objc_msgSend(v6, "style");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "tv_visualEffect");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setVisualEffectViewBackgroundEnabled:", objc_msgSend(v20, "isEqualToString:", CFSTR("background-blur")));

    memset(&v35, 0, sizeof(v35));
    objc_msgSend(v6, "style");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
      objc_msgSend(v21, "tv_focusTransform");
    else
      memset(&v35, 0, sizeof(v35));

    v34 = v35;
    if (!CGAffineTransformIsIdentity(&v34))
    {
      v32 = *MEMORY[0x24BDBEFB0];
      v33 = v32;
      v34 = v35;
      +[TVMLUtilities getValuesFromTransform:translation:rotation:](TVMLUtilities, "getValuesFromTransform:translation:rotation:", &v34, &v33, &v32);
      objc_msgSend(v8, "floatingView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setContentMotionRotation:translation:", v32, v33);

    }
    memset(&v34, 0, 32);
    if (+[TVMLUtilities _cornerRadiiFromElement:cornerRadii:circle:](TVMLUtilities, "_cornerRadiiFromElement:cornerRadii:circle:", v6, &v34, 0))
    {
      +[TVCornerUtilities radiusFromCornerRadii:](TVCornerUtilities, "radiusFromCornerRadii:", v34.a, v34.b, v34.c, v34.d);
      v25 = v24;
      objc_msgSend(v8, "floatingView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setCornerRadius:", v25);

    }
    objc_msgSend(v6, "style");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "tv_backgroundColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "color");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend(v8, "floatingView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setRoundContentWhenDeselected:", 1);

    }
  }

  return v7;
}

- (id)_cardViewFromElement:(id)a3 existingView:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  __int128 v56;
  __int128 v57;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    objc_msgSend(v8, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "subviews");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
    objc_msgSend(v8, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "subviews");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "makeObjectsPerformSelector:", sel_removeFromSuperview);

    objc_msgSend((id)objc_opt_class(), "_organizerViewWithElement:elements:existingView:", v6, 0, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "bounds");
    v17 = v16;
    v19 = v18;
    objc_msgSend(v6, "style");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "tv_padding");
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;

    v29 = v17 - v24 - v28;
    v30 = v19 - v22 - v26;
    objc_msgSend(v15, "setFrame:", v24, v22, v29, v30);
    v56 = TVCornerRadiiZero;
    v57 = *(_OWORD *)&qword_222E77538;
    +[TVMLUtilities _cornerRadiiFromElement:cornerRadii:circle:](TVMLUtilities, "_cornerRadiiFromElement:cornerRadii:circle:", v6, &v56, 0);
    +[TVCornerUtilities radiusFromCornerRadii:](TVCornerUtilities, "radiusFromCornerRadii:", v56, v57);
    v32 = v31;
    objc_msgSend(v6, "style");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "tv_backgroundColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "color");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "contentView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (v35)
    {
      objc_msgSend(v36, "setBackgroundColor:", v35);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setBackgroundColor:", v38);

    }
    objc_msgSend(v8, "contentView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "layer");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setCornerRadius:", v32);

    objc_msgSend(v8, "contentView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addSubview:", v15);

    objc_msgSend(v8, "setAllowsFocus:", objc_msgSend(v6, "isDisabled") ^ 1);
    objc_msgSend(v6, "style");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "tv_shadow");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "contentView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "layer");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v45;
    if (v43)
    {
      objc_msgSend(v45, "setShadowPath:", +[TVMLUtilities _shadowPathForViewElement:withCornerRadii:andScaledSize:](TVMLUtilities, "_shadowPathForViewElement:withCornerRadii:andScaledSize:", v6, v56, v57, v29, v30));

      objc_msgSend(v8, "contentView");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "layer");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "shadowOffset");
      objc_msgSend(v49, "setShadowOffset:");

      objc_msgSend(v8, "contentView");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "layer");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "shadowBlurRadius");
      objc_msgSend(v51, "setShadowRadius:");

      objc_msgSend(v8, "contentView");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "layer");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "shadowColor");
      v54 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v53, "setShadowColor:", objc_msgSend(v54, "CGColor"));

      objc_msgSend(v8, "contentView");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "layer");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v45;
      LODWORD(v46) = 1.0;
    }
    else
    {
      LODWORD(v46) = 0;
    }
    objc_msgSend(v45, "setShadowOpacity:", v46);

  }
  else
  {
    -[TVMLViewFactory _organizerViewForElement:existingView:](self, "_organizerViewForElement:existingView:", v6, v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)_textBoxViewForElement:(id)a3 existingView:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  int64_t v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  id v37;
  unsigned int v38;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
  }
  else
  {
    v8 = objc_alloc(MEMORY[0x24BDF6EF8]);
    v7 = (id)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  }
  v9 = v7;
  objc_msgSend(v5, "style");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ikColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "color");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_accessibilityHigherContrastTintColorForColor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "tv_attributedStringWithForegroundColor:textAlignment:", v13, objc_msgSend(v10, "tv_textAlignment"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");
  objc_msgSend(v5, "attributes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("showsScrollIndicator"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v17, "BOOLValue");

  if (objc_msgSend(v15, "length"))
  {
    v36 = v13;
    v37 = v6;
    v35 = v14;
    v18 = objc_msgSend(v14, "length");
    objc_msgSend(v15, "attributesAtIndex:effectiveRange:", 0, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *MEMORY[0x24BDF6628];
    objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x24BDF6628]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "mutableCopy");
    v23 = v22;
    if (v22)
      v24 = v22;
    else
      v24 = objc_alloc_init(MEMORY[0x24BDF6748]);
    v25 = v24;

    objc_msgSend(v25, "setLineBreakMode:", 0);
    objc_msgSend(v5, "style");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "tv_textHyphenationFactor");
    *(float *)&v27 = v27;
    objc_msgSend(v25, "setHyphenationFactor:", v27);

    objc_msgSend(v15, "removeAttribute:range:", v20, 0, v18);
    v28 = (void *)objc_msgSend(v25, "copy");
    objc_msgSend(v15, "addAttribute:value:range:", v20, v28, 0, v18);

    objc_msgSend(v15, "tv_addLanguageAwareness:", 0);
    v13 = v36;
    v6 = v37;
    v14 = v35;
  }
  v29 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v9, "setAttributedText:", v29);

  objc_msgSend(v5, "style");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = +[TVMLUtilities semanticAlignmentForAlignment:semanticContentAttribute:](TVMLUtilities, "semanticAlignmentForAlignment:semanticContentAttribute:", objc_msgSend(v30, "tv_alignment"), objc_msgSend(v5, "tv_semanticContentAttribute"));

  if (!v31)
    objc_msgSend(v9, "setTextAlignment:", 4);
  objc_msgSend(v10, "tv_padding");
  objc_msgSend(v9, "setTextContainerInset:");
  objc_msgSend(v9, "setBounces:", 1);
  objc_msgSend(v9, "setShowsVerticalScrollIndicator:", v38);
  objc_msgSend(v10, "tv_backgroundColor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "color");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v33);

  objc_msgSend(v9, "setEditable:", 0);
  objc_msgSend(v9, "_setGradientMaskInsets:", 90.0, 0.0, 90.0, 0.0);
  objc_msgSend(v9, "setAutoresizingMask:", 18);
  objc_msgSend(v9, "setAdjustsFontForContentSizeCategory:", 1);

  return v9;
}

- (id)_labelViewForElement:(id)a3 existingView:(id)a4
{
  id v5;
  id v6;
  _TVLabel *v7;
  _TVLabel *v8;
  _TVLabel *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  double v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  double v87;
  double v88;
  double v89;
  float v90;
  double v91;
  void *v92;
  uint64_t v93;
  void *v94;
  double v95;
  double v96;
  float v97;
  _TVLabel *v98;
  void *v99;
  void *v100;
  double v101;
  void *v102;
  void *v103;
  void *v104;
  void *v106;
  void *v107;
  void *v108;
  id v109;
  void *v110;
  void *v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  _BYTE v116[128];
  uint64_t v117;

  v117 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "style");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v107 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (_TVLabel *)v6;
  }
  else
  {
    v8 = [_TVLabel alloc];
    v7 = -[_TVLabel initWithFrame:](v8, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  }
  v9 = v7;
  objc_msgSend(v5, "style");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tv_color");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "color");
  v108 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "style");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "tv_highlightColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "color");
  v111 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v5;
  else
    v14 = 0;
  v112 = 0u;
  v113 = 0u;
  v114 = 0u;
  v115 = 0u;
  v109 = v14;
  objc_msgSend(v109, "badges");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v112, v116, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v113;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v113 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * i);
        objc_msgSend(v20, "badge");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "style");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "tv_tintColor");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setTintColor:", v23);

        objc_msgSend(v21, "style");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "tv_highlightColor");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "tv_setHighlightColor:", v25);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v112, v116, 16);
    }
    while (v17);
  }

  objc_msgSend(v5, "style");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "tv_textHighlightStyle");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v27, "isEqualToString:", CFSTR("show-on-highlight")))
  {

    v28 = v109;
  }
  else
  {
    objc_msgSend(v5, "style");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "tv_textHighlightStyle");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("marquee-and-show-on-highlight"));

    v28 = v109;
    if (!v31)
    {
      -[_TVLabel setHighlightedTextColor:](v9, "setHighlightedTextColor:", v111);
      objc_msgSend(v109, "cachedAttributedString");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v32)
      {
        objc_msgSend(v5, "tv_attributedString");
        v36 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_24;
      }
LABEL_23:
      v36 = v32;
      v32 = v36;
LABEL_24:
      v35 = v36;
      goto LABEL_25;
    }
  }
  -[_TVLabel setHighlightedTextColor:](v9, "setHighlightedTextColor:", 0);
  objc_msgSend(v28, "cachedAttributedString");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
    goto LABEL_23;
  if (v111)
    v33 = v111;
  else
    v33 = v108;
  objc_msgSend(v5, "style");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tv_attributedStringWithForegroundColor:textAlignment:", v33, objc_msgSend(v34, "tv_textAlignment"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_25:
  v37 = v110;

  objc_msgSend(v28, "setCachedAttributedString:", v35);
  objc_msgSend(v5, "style");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "tv_textTransform");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "length");

  if (!v40)
    goto LABEL_36;
  objc_msgSend(v5, "style");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "tv_textTransform");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "isEqualToString:", CFSTR("uppercase"));

  if (v43)
  {
    objc_msgSend(v35, "string");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "localizedUppercaseString");
    v45 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "style");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "tv_textTransform");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "isEqualToString:", CFSTR("lowercase"));

    if (v48)
    {
      objc_msgSend(v35, "string");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "localizedLowercaseString");
      v45 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v5, "style");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "tv_textTransform");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v50, "isEqualToString:", CFSTR("capitalize"));

      if (!v51)
      {
        v52 = 0;
        goto LABEL_33;
      }
      objc_msgSend(v35, "string");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "localizedCapitalizedString");
      v45 = objc_claimAutoreleasedReturnValue();
    }
  }
  v52 = (void *)v45;

LABEL_33:
  if (objc_msgSend(v52, "length"))
  {
    v53 = (void *)objc_msgSend(v35, "mutableCopy");
    objc_msgSend(v53, "replaceCharactersInRange:withString:", 0, objc_msgSend(v35, "length"), v52);
    v54 = objc_msgSend(v53, "copy");

    v35 = (void *)v54;
  }

LABEL_36:
  objc_msgSend(v35, "tv_defaultAttributes");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v55;
  if (v55)
  {
    v57 = (void *)objc_msgSend(v55, "mutableCopy");
    v58 = *MEMORY[0x24BDF6600];
    objc_msgSend(v56, "objectForKeyedSubscript:", *MEMORY[0x24BDF6600]);
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v59)
    {
      objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "setObject:forKeyedSubscript:", v60, v58);

    }
    v61 = *MEMORY[0x24BDF6640];
    objc_msgSend(v56, "objectForKeyedSubscript:", *MEMORY[0x24BDF6640]);
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v62)
    {
      v63 = objc_alloc_init(MEMORY[0x24BDF6758]);
      objc_msgSend(v57, "setObject:forKeyedSubscript:", v63, v61);

    }
    v64 = (void *)objc_msgSend(v57, "copy");
    -[_TVLabel _setDefaultAttributes:](v9, "_setDefaultAttributes:", v64);

  }
  -[_TVLabel setAttributedText:](v9, "setAttributedText:", v35);
  objc_msgSend(v5, "style");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVLabel setNumberOfLines:](v9, "setNumberOfLines:", objc_msgSend(v65, "tv_maxTextLines"));

  objc_msgSend(v5, "style");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVLabel setAdjustsFontSizeToFitWidth:](v9, "setAdjustsFontSizeToFitWidth:", objc_msgSend(v66, "tv_adjustsFontSizeToFitWidth"));

  objc_msgSend(v5, "style");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "tv_minimumScaleFactor");
  -[_TVLabel setMinimumScaleFactor:](v9, "setMinimumScaleFactor:");

  objc_msgSend(v5, "style");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "tv_fontSize");
  -[_TVLabel setAdjustsFontForContentSizeCategory:](v9, "setAdjustsFontForContentSizeCategory:", v69 == 0.0);

  objc_msgSend(v5, "style");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "tv_padding");
  -[_TVLabel setPadding:](v9, "setPadding:");

  objc_msgSend(v110, "tv_backgroundColor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "color");
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  if (v72)
  {
    objc_msgSend(v110, "tv_backgroundColor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "color");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVLabel setBackgroundColor:](v9, "setBackgroundColor:", v74);

  }
  else
  {
    -[_TVLabel setBackgroundColor:](v9, "setBackgroundColor:", 0);
    -[_TVLabel setOpaque:](v9, "setOpaque:", 0);
  }
  objc_msgSend(v5, "style");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "valueForStyle:", CFSTR("text-shadow"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  if (v76)
  {
    objc_msgSend(v76, "shadowBlurRadius");
    -[_TVLabel setShadowBlur:](v9, "setShadowBlur:");
    objc_msgSend(v76, "shadowColor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    if (v77)
    {
      objc_msgSend(v76, "shadowColor");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      -[_TVLabel setShadowColor:](v9, "setShadowColor:", v78);

    }
    objc_msgSend(v76, "shadowOffset");
    -[_TVLabel setShadowOffset:](v9, "setShadowOffset:");
  }
  if (objc_msgSend(v5, "tv_elementType") == 33)
  {
    objc_msgSend(v5, "attributes");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("minLength"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = objc_msgSend(v80, "integerValue");

    objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", CFSTR("%d"), 0);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(&stru_24EB8B108, "stringByPaddingToLength:withString:startingAtIndex:", v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVLabel attributedText](v9, "attributedText");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = (void *)objc_msgSend(v83, "mutableCopy");

    objc_msgSend(v84, "mutableString");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "mutableString");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "replaceCharactersInRange:withString:", 0, objc_msgSend(v86, "length"), v82);

    v87 = *MEMORY[0x24BDBF148];
    v88 = *(double *)(MEMORY[0x24BDBF148] + 8);
    objc_msgSend(v84, "boundingRectWithSize:options:context:", 3, 0, *MEMORY[0x24BDBF148], v88);
    v90 = v89;
    v91 = ceilf(v90);
    -[_TVLabel attributedText](v9, "attributedText");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = objc_msgSend(v92, "length");

    if (v93 == v81)
    {
      -[_TVLabel attributedText](v9, "attributedText");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "boundingRectWithSize:options:context:", 3, 0, v87, v88);
      v96 = v95;

      v97 = v96;
      v91 = fmax(v91, ceilf(v97));
    }
    v98 = v9;
    -[UIView transferLayoutStylesFromElement:](v98, "transferLayoutStylesFromElement:", v5);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v91);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setValue:forTVViewStyle:](v98, "setValue:forTVViewStyle:", v99, CFSTR("width"));

    v100 = (void *)MEMORY[0x24BDD16E0];
    -[_TVLabel size](v98, "size");
    objc_msgSend(v100, "numberWithDouble:", v101);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setValue:forTVViewStyle:](v98, "setValue:forTVViewStyle:", v102, CFSTR("height"));

    v28 = v109;
    v37 = v110;
  }
  -[UIView transferLayoutStylesFromElement:](v9, "transferLayoutStylesFromElement:", v5);
  objc_msgSend(v5, "style");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "tv_textHighlightStyle");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setValue:forTVViewStyle:](v9, "setValue:forTVViewStyle:", v104, CFSTR("tv-text-highlight-style"));

  return v9;
}

- (id)_headerColumnViewForElement:(id)a3 existingView:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _TVHeaderColumnView *v12;
  _TVHeaderColumnView *v13;
  void *v14;
  void *v15;
  _TVHeaderColumnView *v16;
  id v17;
  id v18;
  id v19;
  _TVHeaderColumnView *v20;
  _TVHeaderColumnView *v21;
  _QWORD v23[4];
  id v24;
  TVMLViewFactory *v25;
  id v26;
  id v27;
  _TVHeaderColumnView *v28;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  objc_msgSend(v8, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "componentsSeparatedByString:", CFSTR("\r"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = (_TVHeaderColumnView *)v7;
  else
    v12 = objc_alloc_init(_TVHeaderColumnView);
  v13 = v12;
  -[_TVHeaderColumnView labelViews](v12, "labelViews");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v11, "count"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __60__TVMLViewFactory__headerColumnViewForElement_existingView___block_invoke;
  v23[3] = &unk_24EB87B60;
  v24 = v14;
  v25 = self;
  v26 = v8;
  v27 = v15;
  v16 = v13;
  v28 = v16;
  v17 = v14;
  v18 = v8;
  v19 = v15;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v23);
  -[_TVHeaderColumnView setLabelViews:](v16, "setLabelViews:", v19);
  v20 = v28;
  v21 = v16;

  return v21;
}

void __60__TVMLViewFactory__headerColumnViewForElement_existingView___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  __CFString *v21;

  v21 = a2;
  if (!-[__CFString length](v21, "length"))
  {

    v21 = CFSTR(" ");
  }
  if (objc_msgSend(*(id *)(a1 + 32), "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 40), "_labelViewForElement:existingView:", *(_QWORD *)(a1 + 48), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "addObject:", v6);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "attributedText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    objc_msgSend(v11, "replaceCharactersInRange:withString:", 0, objc_msgSend(v11, "length"), v21);
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v9, "setAttributedText:", v12);

    objc_msgSend(v9, "setNumberOfLines:", 1);
    if (!a3)
    {
      objc_msgSend(v9, "_defaultAttributes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x24BDF65F8]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = *(void **)(a1 + 64);
      objc_msgSend(v14, "leading");
      v17 = v16;
      objc_msgSend(v14, "lineHeight");
      v19 = ceil(v18);
      objc_msgSend(v14, "lineHeight");
      objc_msgSend(v15, "setLineSpacing:", v17 - (v19 - v20));

    }
  }

}

- (id)_zoomableTextViewFromElement:(id)a3 alwaysFocusable:(BOOL)a4 existingView:(id)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  _TVZoomableTextView *v9;
  _TVZoomableTextView *v10;
  _TVZoomableTextView *v11;

  v5 = a4;
  v7 = a5;
  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = (_TVZoomableTextView *)v7;
  }
  else
  {
    v10 = [_TVZoomableTextView alloc];
    v9 = -[_TVZoomableTextView initWithFrame:](v10, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  }
  v11 = v9;
  -[TVFocusableTextView setAlwaysFocusable:](v9, "setAlwaysFocusable:", v5);
  -[_TVZoomableTextView updateWithViewElement:](v11, "updateWithViewElement:", v8);

  return v11;
}

- (id)_organizerViewForElement:(id)a3 existingView:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _TVOrganizerView *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  _TVOrganizerView *v17;
  void *v18;
  id v19;
  unsigned int v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend((id)objc_opt_class(), "_organizerViewWithElement:elements:existingView:", v5, 0, v6);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "transferLayoutStylesFromElement:", v5);
      goto LABEL_20;
    }
  }
  v7 = v6;
  objc_opt_class();
  objc_opt_isKindOfClass();
  objc_msgSend(v7, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v7, "isFocused");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v22 = v8;
  objc_msgSend(v8, "subviews");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          objc_msgSend(v15, "removeFromSuperview");
        else
          v12 = v15;
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v11);

    v16 = v22;
    if (v12)
      goto LABEL_18;
  }
  else
  {

    v16 = v8;
  }
  v17 = [_TVOrganizerView alloc];
  objc_msgSend(v16, "bounds");
  v12 = -[_TVOrganizerView initWithFrame:](v17, "initWithFrame:");
  -[_TVOrganizerView setAutoresizingMask:](v12, "setAutoresizingMask:", 18);
  objc_msgSend(v16, "addSubview:", v12);
LABEL_18:
  objc_msgSend((id)objc_opt_class(), "_organizerViewWithElement:elements:existingView:", v5, 0, v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "transferLayoutStylesFromElement:", v5);
  objc_msgSend(v18, "tv_setAssociatedIKViewElement:", v5);
  objc_msgSend(v18, "setSelected:animated:", v21, 0);
  v19 = v7;

LABEL_20:
  return v19;
}

- (id)_activityIndicatorViewForElement:(id)a3 existingView:(id)a4
{
  id v5;
  id v6;
  _TVActivityView *v7;
  _TVActivityView *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  _TVSpinnerView *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  _TVSpinnerView *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = (_TVActivityView *)v6;
  else
    v7 = objc_alloc_init(_TVActivityView);
  v8 = v7;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v5, "children", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        if (objc_msgSend(v14, "tv_elementType") == 55)
        {
          +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "_viewFromElement:existingView:", v14, 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            -[_TVActivityView setTextView:](v8, "setTextView:", v16);

            goto LABEL_15;
          }
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_15:

  v17 = [_TVSpinnerView alloc];
  objc_msgSend(v5, "style");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "tv_width");
  v20 = v19;
  objc_msgSend(v5, "style");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "tv_height");
  v23 = v22;
  objc_msgSend(v5, "style");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "tv_color");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "color");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[_TVSpinnerView initWithFrame:color:](v17, "initWithFrame:color:", v26, 0.0, 0.0, v20, v23);

  -[_TVSpinnerView startAnimating](v27, "startAnimating");
  -[UIView transferLayoutStylesFromElement:](v27, "transferLayoutStylesFromElement:", v5);
  -[_TVActivityView setActivityView:](v8, "setActivityView:", v27);

  return v8;
}

- (id)_imageViewForBadgeElement:(id)a3 existingView:(id)a4
{
  id v5;
  id v6;
  _TVImageView *v7;
  _TVImageView *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  _TVImageView *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  TVImageScaleDecorator *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  int v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  uint64_t v50;
  id v52;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = (_TVImageView *)v6;
  else
    v7 = objc_alloc_init(_TVImageView);
  v8 = v7;
  v9 = v5;
  objc_msgSend(v9, "tv_imageProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tv_imageScaleToSize");
  v12 = v11;
  v14 = v13;
  objc_msgSend(v9, "style");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "tv_tintColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "color");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "style");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "tv_highlightColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "color");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v28 = (void *)TVMLKitLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_ERROR))
      -[TVMLViewFactory _imageViewForBadgeElement:existingView:].cold.1(v28, v9);
    v29 = 0;
    goto LABEL_28;
  }
  v52 = v6;
  v21 = v20;
  v22 = v17;
  objc_msgSend(v9, "style");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "tv_borderWidths");
  if (v27 == *(double *)(MEMORY[0x24BDF7718] + 8)
    && v24 == *MEMORY[0x24BDF7718]
    && v26 == *(double *)(MEMORY[0x24BDF7718] + 24)
    && v25 == *(double *)(MEMORY[0x24BDF7718] + 16))
  {

LABEL_15:
    v37 = objc_alloc_init(TVImageScaleDecorator);
    goto LABEL_16;
  }
  objc_msgSend(v9, "style");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "tv_borderColor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "color");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v32)
    goto LABEL_15;
  objc_msgSend(v9, "style");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "tv_borderColor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "color");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "style");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "tv_borderWidths");
  +[TVImageOutlineDecorator decoratorWithOutlineColor:outlineWidths:](TVImageOutlineDecorator, "decoratorWithOutlineColor:outlineWidths:", v35);
  v37 = (TVImageScaleDecorator *)objc_claimAutoreleasedReturnValue();

LABEL_16:
  v17 = v22;
  v20 = v21;
  v6 = v52;
  -[TVImageScaleDecorator setScaleToSize:](v37, "setScaleToSize:", v12, v14);
  objc_msgSend(v10, "setDecorator:", v37);
  objc_msgSend(v9, "appDocument");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "requestLoader");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRequestLoader:", v39);

  objc_msgSend(v10, "setLoadSynchronouslyIfCached:", 1);
  -[_TVImageView imageProxy](v8, "imageProxy");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "isEqual:", v10);

  -[_TVImageView setImageProxy:](v8, "setImageProxy:", v10);
  -[_TVImageView setContentMode:](v8, "setContentMode:", 1);
  -[_TVImageView setContentsPosition:](v8, "setContentsPosition:", 2);
  -[_TVImageView _setTintColor:](v8, "_setTintColor:", v17);
  -[_TVImageView _setFocusedColor:](v8, "_setFocusedColor:", v20);
  -[_TVImageView setSemanticContentAttribute:](v8, "setSemanticContentAttribute:", objc_msgSend(v9, "tv_semanticContentAttribute"));
  objc_msgSend(v9, "parent");
  v42 = objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v43 = (void *)v42;
    while (objc_msgSend(v43, "tv_elementType") != 35)
    {
      objc_msgSend(v43, "parent");
      v44 = objc_claimAutoreleasedReturnValue();

      v43 = (void *)v44;
      if (!v44)
        goto LABEL_20;
    }
    -[_TVImageView _loadImage](v8, "_loadImage");

  }
  else
  {
LABEL_20:
    if (v52)
      v45 = v41;
    else
      v45 = 0;
    if (v45 == 1)
    {
      objc_msgSend(v9, "url");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "tv_isResourceURL");

      if (v47)
        -[_TVImageView _reloadImageForLayoutDirectionChange](v8, "_reloadImageForLayoutDirectionChange");
    }
  }
  objc_msgSend(v9, "attributes");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("handlesInteraction"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "BOOLValue");

  -[_TVImageView setUserInteractionEnabled:](v8, "setUserInteractionEnabled:", v50);
  +[_TVControlTarget addTargetInControl:withViewElement:](_TVControlTarget, "addTargetInControl:withViewElement:", v8, v9);
  v29 = v8;

LABEL_28:
  return v29;
}

- (id)_imageViewForElement:(id)a3 layout:(id)a4 existingView:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend((id)objc_opt_class(), "imageViewWithElement:layout:existingView:", v9, v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_loadingImageViewForElement:(id)a3 existingView:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  _TVLoadingImageView *v17;

  v4 = a3;
  objc_msgSend(v4, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BE51840]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "attributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BE51838]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0.0;
  v10 = 0.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v10 = (float)objc_msgSend(v6, "integerValue");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 = (float)objc_msgSend(v8, "integerValue");
  objc_msgSend(v4, "style");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "tv_width");
  v13 = v12;

  objc_msgSend(v4, "style");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "tv_height");
  v16 = v15;

  if (v13 == 0.0 || v16 == 0.0)
  {
    v13 = v10;
    v16 = v9;
  }
  v17 = -[_TVLoadingImageView initWithFrame:]([_TVLoadingImageView alloc], "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), v13, v16);

  return v17;
}

- (id)_monogramViewForElement:(id)a3 layout:(id)a4 existingView:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v28;
  _TVMonogramView *v29;
  double v30;
  double v31;
  TVMonogramViewConfiguration *v32;
  TVMonogramViewConfiguration *v33;
  void *v34;
  uint64_t v35;
  char isKindOfClass;
  _TVMonogramView *v37;
  void *v38;
  char v39;
  uint64_t v40;
  void *v41;
  char v42;
  double v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _TVMonogramDescription *v51;
  _TVMonogramDescription *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  _TVMonogramDescription *v70;
  void *v71;
  void *v72;
  void *v73;
  TVMonogramViewConfiguration *v74;
  id v75;
  uint64_t v76;
  void *v77;
  void *v78;
  __int128 v79;
  __int128 v80;
  char v81[9];

  v7 = a3;
  v8 = a5;
  v9 = v7;
  v10 = a4;
  -[objc_class layoutWithLayout:element:](+[TVViewLayout layoutClassForElement:](TVViewLayout, "layoutClassForElement:", v9), "layoutWithLayout:element:", v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "decoratorSize");
  v13 = v12;
  v15 = v14;
  objc_msgSend(v11, "padding");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  objc_msgSend(v9, "attributes");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKey:", CFSTR("contentsMode"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
    v26 = objc_msgSend(v9, "tv_scaleMode");
  else
    v26 = 0;

  if (v13 < 0.00000011920929 || v15 < 0.00000011920929)
  {
    v28 = (void *)TVMLKitLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_ERROR))
      -[TVMLViewFactory _monogramViewForElement:layout:existingView:].cold.1(v28, v9);
    v29 = 0;
  }
  else
  {
    v76 = v26;
    v81[0] = 0;
    v79 = TVCornerRadiiZero;
    v80 = *(_OWORD *)&qword_222E77538;
    +[TVMLUtilities _cornerRadiiFromElement:cornerRadii:circle:](TVMLUtilities, "_cornerRadiiFromElement:cornerRadii:circle:", v9, &v79, v81);
    +[TVCornerUtilities radiusFromCornerRadii:](TVCornerUtilities, "radiusFromCornerRadii:", v79, v80);
    v31 = v30;
    v32 = [TVMonogramViewConfiguration alloc];
    v33 = -[TVMonogramViewConfiguration initWithShadowImages:](v32, "initWithShadowImages:", v81[0]);
    objc_msgSend(v11, "highlightColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "tintColor");
    v35 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "focusSizeIncrease");
    -[TVMonogramViewConfiguration setFocusedSizeIncrease:](v33, "setFocusedSizeIncrease:");
    -[TVMonogramViewConfiguration setFocusedBgColor:](v33, "setFocusedBgColor:", v34);
    v78 = (void *)v35;
    -[TVMonogramViewConfiguration setUnfocusedBgColor:](v33, "setUnfocusedBgColor:", v35);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      v37 = (_TVMonogramView *)v8;
    else
      v37 = -[_TVMonogramView initWithFrame:configuration:]([_TVMonogramView alloc], "initWithFrame:configuration:", v33, 0.0, 0.0, v13, v15);
    v29 = v37;
    -[_TVMonogramView setFocusedStateEnabled:](v37, "setFocusedStateEnabled:", objc_msgSend(v11, "acceptsFocus"));
    -[_UIFloatingContentView setControlState:animated:](v29, "setControlState:animated:", 0, 0);
    -[TVMonogramViewConfiguration focusedSizeIncrease](v33, "focusedSizeIncrease");
    -[_UIFloatingContentView setFocusedSizeIncrease:](v29, "setFocusedSizeIncrease:");
    -[UIView transferLayoutStylesFromElement:](v29, "transferLayoutStylesFromElement:", v9);
    objc_msgSend(v11, "placeholderArtworkName");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "isEqualToString:", CFSTR("none"));
    v40 = 0;
    if ((v39 & 1) == 0)
    {
      if ((objc_msgSend(v9, "tv_isResource") & 1) != 0
        || (objc_msgSend(v9, "tv_isSymbol") & 1) != 0
        || !objc_msgSend(v38, "length"))
      {
        v40 = 0;
      }
      else
      {
        +[TVMLUtilities _placeholderImageForViewElement:](TVMLUtilities, "_placeholderImageForViewElement:", v9);
        v40 = objc_claimAutoreleasedReturnValue();
      }
    }
    v77 = (void *)v40;
    -[_TVMonogramView setPlaceholderImage:](v29, "setPlaceholderImage:", v40);
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("TVConfigureForMetrics"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "BOOLValue");

    if ((v42 & 1) == 0)
    {
      v72 = v38;
      v73 = v34;
      v74 = v33;
      v75 = v8;
      -[TVMonogramViewConfiguration focusedSizeIncrease](v33, "focusedSizeIncrease");
      objc_msgSend(v9, "tv_urlWithSize:focusSizeIncrease:", v13, v15, v43);
      v44 = objc_claimAutoreleasedReturnValue();
      v70 = [_TVMonogramDescription alloc];
      objc_msgSend(v9, "attributes");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("firstName"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "attributes");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("lastName"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "style");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      +[TVMLUtilities fontFromStyle:](TVMLUtilities, "fontFromStyle:", v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v70;
      v71 = (void *)v44;
      v52 = -[_TVMonogramDescription initWithFirstName:lastName:imageURL:font:](v51, "initWithFirstName:lastName:imageURL:font:", v46, v48, v44, v50);

      objc_msgSend(v9, "appDocument");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "requestLoader");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[_TVMonogramDescription setRequestLoader:](v52, "setRequestLoader:", v54);

      -[_TVMonogramDescription setSize:](v52, "setSize:", v13, v15);
      -[_TVMonogramDescription setPadding:](v52, "setPadding:", v17, v19, v21, v23);
      if (v76)
      {
        -[_TVMonogramDescription setScaleMode:](v52, "setScaleMode:", v76);
        if (v76 == 2)
        {
          objc_msgSend(v11, "backgroundColor");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          -[_TVMonogramDescription setBackgroundColor:](v52, "setBackgroundColor:", v55);

        }
      }
      v33 = v74;
      -[TVMonogramViewConfiguration focusedSizeIncrease](v74, "focusedSizeIncrease");
      -[_TVMonogramDescription setUpscaleAdjustment:](v52, "setUpscaleAdjustment:");
      -[_TVMonogramDescription setCornerRadius:](v52, "setCornerRadius:", v31);
      objc_msgSend(v9, "style");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "tv_borderWidths");
      v58 = v57;
      v60 = v59;
      v62 = v61;
      v64 = v63;

      -[_TVMonogramDescription setBorderWidth:](v52, "setBorderWidth:", fmax(fmax(v58, v62), fmax(v60, v64)));
      objc_msgSend(v9, "style");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "tv_borderColor");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "color");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      -[_TVMonogramDescription setBorderColor:](v52, "setBorderColor:", v67);

      -[_TVMonogramDescription setFillColor:](v52, "setFillColor:", v78);
      -[_TVMonogramDescription setShouldFallBackToSilhouette:](v52, "setShouldFallBackToSilhouette:", v72 == 0);
      objc_msgSend(v9, "tv_imageProxy");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[_TVMonogramView setImageProxy:](v29, "setImageProxy:", v68);

      v38 = v72;
      -[_TVMonogramView setMonogramDescription:](v29, "setMonogramDescription:", v52);

      v8 = v75;
      v34 = v73;
    }

  }
  return v29;
}

- (id)_rowViewForElement:(id)a3 existingView:(id)a4
{
  id v5;
  id v6;
  _TVRowView *v7;
  _TVRowView *v8;
  _TVRowView *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  unint64_t v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *, unint64_t);
  void *v32;
  id v33;
  id v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (_TVRowView *)v6;
  }
  else
  {
    v8 = [_TVRowView alloc];
    v7 = -[_TVRowView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  }
  v9 = v7;
  v10 = objc_msgSend(v5, "tv_semanticContentAttribute");
  -[_TVRowView setSemanticContentAttribute:](v9, "setSemanticContentAttribute:", v10);
  objc_msgSend(v6, "tv_associatedIKViewElement");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11 == v5 && (objc_msgSend(v5, "updateType") == 1 || objc_msgSend(v5, "updateType") == 3))
  {
    objc_msgSend(v6, "components");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v5, "attributes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("firstItem"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "length") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v16 = objc_msgSend(v15, "integerValue");
    v38[3] = v16;
  }
  objc_msgSend(v5, "style");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVRowView setContentVerticalAlignment:](v9, "setContentVerticalAlignment:", objc_msgSend(v17, "tv_contentAlignment"));

  objc_msgSend(v5, "children");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = MEMORY[0x24BDAC760];
  v30 = 3221225472;
  v31 = __51__TVMLViewFactory__rowViewForElement_existingView___block_invoke;
  v32 = &unk_24EB87B88;
  v19 = v12;
  v33 = v19;
  v35 = &v37;
  v36 = v10;
  v20 = v13;
  v34 = v20;
  objc_msgSend(v18, "enumerateObjectsUsingBlock:", &v29);

  -[_TVRowView setComponents:](v9, "setComponents:", v20, v29, v30, v31, v32);
  v21 = v38[3];
  if (v21 != 0x7FFFFFFFFFFFFFFFLL && v21 < objc_msgSend(v20, "count"))
  {
    objc_msgSend(v20, "objectAtIndexedSubscript:", v38[3]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "canBecomeFocused");

    if (v23)
    {
      objc_msgSend(v20, "objectAtIndexedSubscript:", v38[3]);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[_TVRowView setPreferredFocusedComponent:](v9, "setPreferredFocusedComponent:", v24);

    }
  }
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "focusedView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "isDescendantOfView:", v9);

  if (v27)
    -[_TVRowView setNeedsFocusUpdate](v9, "setNeedsFocusUpdate");

  _Block_object_dispose(&v37, 8);
  return v9;
}

void __51__TVMLViewFactory__rowViewForElement_existingView___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_viewFromElement:existingView:", v11, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v11, "autoHighlightIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (v9)
    {
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      if (*(_QWORD *)(v10 + 24) == 0x7FFFFFFFFFFFFFFFLL)
        *(_QWORD *)(v10 + 24) = a3;
      objc_msgSend(v11, "resetProperty:", 2);
    }
    objc_msgSend(v7, "setSemanticContentAttribute:", *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
  }

}

- (id)_buttonForElement:(id)a3 existingView:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "buttonForElement:existingView:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)buttonForElement:(id)a3 existingView:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _BOOL8 v9;
  BOOL v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_class *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  BOOL v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  double v86;
  void *v87;
  void *v88;
  double v89;
  void *v90;
  void *v91;
  unint64_t v92;
  void *v93;
  void *v94;
  uint64_t v95;
  double v96;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  id v102;
  void *v104;
  void *v105;
  BOOL v106;
  id v107;
  id v108;
  id v109;
  void *v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  _BYTE v117[128];
  uint64_t v118;

  v118 = *MEMORY[0x24BDAC8D0];
  v107 = a3;
  v5 = a4;
  objc_msgSend(v107, "appDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "templateElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[TVMLUtilities interfaceStyleForTemplateElement:](TVMLUtilities, "interfaceStyleForTemplateElement:", v7) == 1)v8 = 4005;
  else
    v8 = 4000;
  v104 = v7;
  if (objc_msgSend(v7, "tv_elementType") == 61 || objc_msgSend(v7, "elementType") == 62)
  {
    v9 = 0;
    v10 = 1;
  }
  else
  {
    objc_msgSend(v7, "appDocument");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "templateElement");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "elementType");
    v10 = v13 == 64;
    v9 = v13 != 64;

  }
  objc_msgSend(v107, "elementName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "isEqualToString:", CFSTR("roundButton"));

  v15 = (objc_class *)objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v5, "backdropStyle") == v8)
  {
    v16 = v5;
  }
  else
  {
    v17 = [v15 alloc];
    v16 = (id)objc_msgSend(v17, "initWithFrame:blurEffectStyle:blurEnabled:", v8, v9, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  }
  v110 = v16;
  if (v10
    || (objc_msgSend(v107, "parent"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v19 = objc_msgSend(v18, "tv_elementType"),
        v18,
        v19 != 44))
  {
    objc_msgSend(v110, "setGroupName:", 0);
    v21 = v107;
  }
  else
  {
    v20 = (void *)MEMORY[0x24BDD17C8];
    v21 = v107;
    objc_msgSend(v107, "parent");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("%p"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v110, "setGroupName:", v23);
  }
  v105 = v5;
  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  objc_msgSend(v21, "children");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v113, v117, 16);
  if (v25)
  {
    v26 = v25;
    v109 = 0;
    v108 = 0;
    v27 = 0;
    v106 = 0;
    v28 = *(_QWORD *)v114;
    v29 = v110;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v114 != v28)
          objc_enumerationMutation(v24);
        v31 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * v30);
        if (objc_msgSend(v31, "tv_elementType") == 55 && v27 == 0)
        {
          +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "textContentView");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "_viewFromElement:existingView:", v31, v40);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v31, "style");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "tv_color");
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v42)
          {
            objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "setTextColor:", v43);

          }
          objc_msgSend(v31, "style");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "tv_highlightColor");
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v45)
          {
            objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "setHighlightedTextColor:", v46);

          }
          if (objc_msgSend(v21, "isDisabled"))
          {
            objc_msgSend(v27, "textColor");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "colorWithAlphaComponent:", 0.4);
            v48 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v27, "setTextColor:", v48);
          }
          objc_msgSend(v31, "attributes");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v49, "tv_BOOLForKey:defaultValue:", CFSTR("usesTintColor"), 0);

          objc_msgSend(v27, "_setTextColorFollowsTintColor:", v50);
          objc_msgSend(v27, "_setWantsUnderlineForAccessibilityButtonShapesEnabled:", 1);
          v29 = v110;
        }
        else if (objc_msgSend(v31, "tv_elementType") == 16
               && (!objc_msgSend(v31, "tv_imageType") ? (v33 = v108 == 0) : (v33 = 0), v33))
        {
          +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "imageView");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "_viewFromElement:existingView:", v31, v52);
          v53 = (void *)objc_claimAutoreleasedReturnValue();

          v29 = v110;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v54 = v53;
          else
            v54 = 0;
          v108 = v54;

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v31, "style");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "tv_visualEffect");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = objc_msgSend(v56, "isEqualToString:", CFSTR("punch-through"));

            objc_msgSend(v110, "setShouldPunchThroughImage:", v57);
          }
          v106 = v27 != 0;
          v21 = v107;
        }
        else if (objc_msgSend(v31, "tv_elementType") == 5 && v109 == 0)
        {
          +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "accessoryView");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "_viewFromElement:existingView:", v31, v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          v21 = v107;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v38 = v37;
          else
            v38 = 0;
          v109 = v38;

        }
        ++v30;
      }
      while (v26 != v30);
      v58 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v113, v117, 16);
      v26 = v58;
    }
    while (v58);
  }
  else
  {
    v109 = 0;
    v108 = 0;
    v27 = 0;
    v106 = 0;
    v29 = v110;
  }

  objc_msgSend(v21, "style");
  v59 = v21;
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "tv_backgroundColor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "color");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (v62)
  {
    objc_msgSend(v59, "style");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "tv_highlightColor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "color");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = v65;
    if (v65)
    {
      v67 = v65;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.8);
      v67 = (id)objc_claimAutoreleasedReturnValue();
    }
    v68 = v67;

    objc_msgSend(v59, "style");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "tv_backgroundColor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "color");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "setBackgroundColor:", v71);

    v29 = v110;
    objc_msgSend(v110, "setHighlightColor:", v68);

  }
  objc_msgSend(v59, "style");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "tv_borderWidths");
  v74 = v73;
  v76 = v75;
  v78 = v77;
  v80 = v79;

  objc_msgSend(v29, "layer");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "setBorderWidth:", fmax(fmax(v74, v78), fmax(v76, v80)));

  objc_msgSend(v29, "layer");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "style");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "tv_borderColor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "color");
  v85 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v82, "setBorderColor:", objc_msgSend(v85, "CGColor"));

  v111 = TVCornerRadiiZero;
  v112 = *(_OWORD *)&qword_222E77538;
  if (+[TVMLUtilities _cornerRadiiFromElement:cornerRadii:circle:](TVMLUtilities, "_cornerRadiiFromElement:cornerRadii:circle:", v59, &v111, 0))
  {
    +[TVCornerUtilities radiusFromCornerRadii:](TVCornerUtilities, "radiusFromCornerRadii:", v111, v112);
  }
  else
  {
    v86 = *(double *)&_kTVButtonDefaultCornerRadius;
  }
  v87 = v110;
  objc_msgSend(v110, "setCornerRadius:", v86);
  objc_msgSend(v59, "parent");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v89 = 8.0;
LABEL_75:
    objc_msgSend(v110, "setContentMotionRotation:translation:", 0.0, 0.0, v89, 8.0);
    goto LABEL_78;
  }
  if (objc_msgSend(v88, "tv_elementType") != 44)
  {
    v89 = 0.0;
    goto LABEL_75;
  }
  objc_msgSend(v88, "parent");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "children");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = objc_msgSend(v91, "indexOfObjectIdenticalTo:", v88);

  if (!v92)
    goto LABEL_70;
  objc_msgSend(v90, "children");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "objectAtIndex:", v92 - 1);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = objc_msgSend(v94, "tv_elementType");

  v87 = v110;
  v96 = 8.0;
  if (v95 != 6)
  {
LABEL_70:
    objc_msgSend(v90, "children");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    if (v92 >= objc_msgSend(v97, "count") - 1)
    {

      v96 = 0.0;
    }
    else
    {
      objc_msgSend(v90, "children");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "objectAtIndex:", v92 + 1);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = objc_msgSend(v99, "tv_elementType");

      v87 = v110;
      if (v100 == 6)
        v96 = 8.0;
      else
        v96 = 0.0;
    }
  }
  objc_msgSend(v87, "setContentMotionRotation:translation:", 0.0, 0.0, 8.0, v96);

  v59 = v107;
LABEL_78:
  objc_msgSend(v87, "setTextContentView:", v27);
  objc_msgSend(v87, "setImageView:", v108);
  objc_msgSend(v87, "setImageTrailsTextContent:", v106);
  objc_msgSend(v87, "setAccessoryView:", v109);
  objc_msgSend(v87, "setViewElement:", v59);
  objc_msgSend(v87, "setDisabled:", objc_msgSend(v59, "isDisabled"));
  objc_msgSend(v59, "style");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "tv_focusSizeIncrease");
  objc_msgSend(v87, "setFocusSizeIncrease:");

  objc_msgSend(v87, "setExclusiveTouch:", 1);
  v102 = v87;

  return v102;
}

- (id)_buttonLockupForElement:(id)a3 existingView:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "buttonLockupForElement:existingView:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)buttonLockupForElement:(id)a3 existingView:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  TVButtonLockup *v20;
  TVButtonLockup *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  TVButtonLockup *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  uint64_t i;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  void *v60;
  double v61;
  void *v62;
  void *v63;
  TVButtonLockup *v64;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  TVButtonLockup *v71;
  uint64_t v72;
  unsigned int v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "appDocument");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "templateElement");
  v8 = objc_claimAutoreleasedReturnValue();

  v68 = (void *)v8;
  v9 = +[TVMLUtilities interfaceStyleForTemplateElement:](TVMLUtilities, "interfaceStyleForTemplateElement:", v8);
  if (v9 == 1)
    v10 = 4005;
  else
    v10 = 4000;
  objc_msgSend(v5, "attributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("theme"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v5, "attributes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("theme"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lowercaseString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "length"))
    {
      if ((objc_msgSend(v15, "isEqualToString:", CFSTR("light")) & 1) != 0)
      {
        v9 = 1;
        v10 = 4005;
      }
      else
      {
        if (objc_msgSend(v15, "isEqualToString:", CFSTR("dark")))
          v9 = 2;
        else
          v9 = 0;
        v10 = 4000;
      }
    }

  }
  objc_msgSend(v5, "parent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "tv_elementType") == 44)
  {
    v17 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v5, "parent");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("%p"), v18);
    v19 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "backdropStyle") == v10)
  {
    v20 = (TVButtonLockup *)v6;
  }
  else
  {
    v21 = [TVButtonLockup alloc];
    v20 = -[TVButtonLockup initWithFrame:blurEffectStyle:groupName:](v21, "initWithFrame:blurEffectStyle:groupName:", v10, v19, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  }
  v71 = v20;
  objc_msgSend(v5, "attributes");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("theme"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v5, "attributes");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("theme"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "lowercaseString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v26, "length"))
      -[TVButtonLockup setVibrantLabelThemeOverride:](v71, "setVibrantLabelThemeOverride:", v9);

  }
  v73 = objc_msgSend(v5, "isDisabled");
  objc_msgSend(v5, "style");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "tv_backgroundColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "color");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v67 = (void *)v19;
  if (v29)
  {
    objc_msgSend(v5, "style");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "tv_highlightColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "color");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v32)
    {
      v34 = v32;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.8);
      v34 = (id)objc_claimAutoreleasedReturnValue();
    }
    v36 = v34;

    objc_msgSend(v5, "style");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "tv_backgroundColor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "color");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v71;
    -[TVButtonLockup setBackgroundColor:](v71, "setBackgroundColor:", v39);

    -[TVButtonLockup setHighlightColor:](v71, "setHighlightColor:", v36);
  }
  else
  {
    v35 = v71;
    -[TVButtonLockup setBackgroundColor:](v71, "setBackgroundColor:", 0);
    -[TVButtonLockup setHighlightColor:](v71, "setHighlightColor:", 0);
  }
  v69 = v6;
  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  objc_msgSend(v5, "children");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v74, v78, 16);
  if (!v41)
  {

    v63 = 0;
    v44 = 0;
    v43 = 0;
    v62 = v67;
    goto LABEL_61;
  }
  v42 = v41;
  v66 = v5;
  v43 = 0;
  v44 = 0;
  v70 = 0;
  v72 = 0;
  v45 = *(_QWORD *)v75;
  v46 = 1.0;
  do
  {
    for (i = 0; i != v42; ++i)
    {
      if (*(_QWORD *)v75 != v45)
        objc_enumerationMutation(v40);
      v48 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
      if (objc_msgSend(v48, "tv_elementType") == 55)
      {
        v49 = v48;
        if (objc_msgSend(v49, "tv_textStyle") == 1)
        {
          if (!v72)
          {
            +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            -[TVButtonLockup titleView](v35, "titleView");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "_viewFromElement:existingView:", v49, v51);
            v72 = objc_claimAutoreleasedReturnValue();
            goto LABEL_53;
          }
        }
        else if (!(v44 | v43))
        {
          objc_msgSend(v49, "style");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "tv_color");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "color");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = v56;
          if (v56)
          {
            v58 = v56;
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
            v58 = (id)objc_claimAutoreleasedReturnValue();
          }
          v50 = v58;

          if (v73)
          {
            objc_msgSend(v50, "colorWithAlphaComponent:", 0.4);
            v59 = objc_claimAutoreleasedReturnValue();

            v50 = (void *)v59;
          }
          v35 = v71;
          objc_msgSend(v49, "tv_attributedStringWithForegroundColor:textAlignment:", v50, 1);
          v44 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "style");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "tv_minimumScaleFactor");
          v46 = v61;

          objc_msgSend(v49, "style");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = objc_msgSend(v51, "tv_maxTextLines");
LABEL_53:

        }
        continue;
      }
      if (objc_msgSend(v48, "tv_elementType") == 16
        || objc_msgSend(v48, "tv_elementType") == 5
        || objc_msgSend(v48, "tv_elementType") == 48)
      {
        if (!(v44 | v43))
        {
          +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          -[TVButtonLockup imageView](v35, "imageView");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "_viewFromElement:existingView:", v48, v53);
          v43 = objc_claimAutoreleasedReturnValue();

        }
        if (v73)
          objc_msgSend((id)v43, "setAlpha:", 0.4);
      }
    }
    v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v74, v78, 16);
  }
  while (v42);

  if (v44)
    -[TVButtonLockup setText:minimumScale:maxNumberOfLines:](v35, "setText:minimumScale:maxNumberOfLines:", v44, v70, v46);
  v5 = v66;
  v62 = v67;
  v63 = (void *)v72;
LABEL_61:
  -[TVButtonLockup setImageView:](v35, "setImageView:", v43);
  -[TVButtonLockup setTitleView:](v35, "setTitleView:", v63);
  -[TVButtonLockup setViewElement:](v35, "setViewElement:", v5);
  -[TVButtonLockup setDisabled:](v35, "setDisabled:", v73);
  v64 = v35;

  return v64;
}

- (id)_segmentedControlForElement:(id)a3 existingView:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  BOOL v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  unint64_t v38;
  unint64_t v39;
  void (**v41)(_QWORD, _QWORD);
  _BOOL4 v42;
  void *v43;
  void *v44;
  id obj;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD v59[8];
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  id v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  char v81;
  _BYTE v82[128];
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
  }
  else
  {
    v8 = objc_alloc(MEMORY[0x24BDF6D78]);
    v7 = (id)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  }
  v9 = v7;
  v42 = (!objc_msgSend(v5, "updateType") || objc_msgSend(v5, "updateType") == 2) && v9 == v6;
  objc_msgSend(v5, "attributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("segmentWidthsByContent"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setApportionsSegmentWidthsByContent:", objc_msgSend(v11, "BOOLValue"));

  v46 = objc_msgSend(v9, "selectedSegmentIndex");
  if (!v42)
    objc_msgSend(v9, "removeAllSegments");
  v78 = 0;
  v79 = &v78;
  v80 = 0x2020000000;
  v81 = 0;
  v72 = 0;
  v73 = &v72;
  v74 = 0x3032000000;
  v75 = __Block_byref_object_copy__4;
  v76 = __Block_byref_object_dispose__4;
  v77 = 0;
  v66 = 0;
  v67 = &v66;
  v68 = 0x3032000000;
  v69 = __Block_byref_object_copy__4;
  v70 = __Block_byref_object_dispose__4;
  v71 = 0;
  v60 = 0;
  v61 = &v60;
  v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__4;
  v64 = __Block_byref_object_dispose__4;
  v65 = 0;
  v59[0] = MEMORY[0x24BDAC760];
  v59[1] = 3221225472;
  v59[2] = __60__TVMLViewFactory__segmentedControlForElement_existingView___block_invoke;
  v59[3] = &unk_24EB87BB0;
  v59[4] = &v72;
  v59[5] = &v66;
  v59[6] = &v60;
  v59[7] = &v78;
  v41 = (void (**)(_QWORD, _QWORD))MEMORY[0x22767F470](v59);
  ((void (**)(_QWORD, id))v41)[2](v41, v5);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  objc_msgSend(v5, "children");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v55, v83, 16);
  if (v13)
  {
    v50 = 0;
    v48 = *(_QWORD *)v56;
    v47 = *MEMORY[0x24BE51818];
    v44 = v9;
    obj = v12;
    do
    {
      v49 = v13;
      for (i = 0; i != v49; ++i)
      {
        if (*(_QWORD *)v56 != v48)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        if (objc_msgSend(v15, "tv_elementType") == 51)
        {
          objc_msgSend(v15, "autoHighlightIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "length"))
            v17 = v46 == -1;
          else
            v17 = 0;
          v18 = v17;

          if (v18)
          {
            objc_msgSend(v5, "children");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = objc_msgSend(v19, "indexOfObject:", v15);

          }
          objc_msgSend(v15, "resetProperty:", 2);
          objc_msgSend(v15, "attributes");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKey:", v47);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v53 = 0u;
          v54 = 0u;
          v51 = 0u;
          v52 = 0u;
          objc_msgSend(v15, "children");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v51, v82, 16);
          if (v23)
          {
            v24 = v6;
            v25 = v5;
            v26 = *(_QWORD *)v52;
            while (2)
            {
              for (j = 0; j != v23; ++j)
              {
                if (*(_QWORD *)v52 != v26)
                  objc_enumerationMutation(v22);
                v28 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
                if (objc_msgSend(v28, "tv_elementType") == 55)
                {
                  v5 = v25;
                  v6 = v24;
                  v9 = v44;
                  if (!*((_BYTE *)v79 + 24))
                    ((void (**)(_QWORD, void *))v41)[2](v41, v28);
                  objc_msgSend(v28, "text");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "string");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v42)
                    objc_msgSend(v44, "setTitle:forSegmentAtIndex:", v30, v50);
                  else
                    objc_msgSend(v44, "insertSegmentWithTitle:atIndex:animated:", v30, v50, 0);

                  objc_msgSend(v43, "addObject:", v15);
                  objc_msgSend(v28, "attributes");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v31, "objectForKey:", v47);
                  v32 = objc_claimAutoreleasedReturnValue();
                  v33 = (void *)v32;
                  if (v32)
                    v34 = (void *)v32;
                  else
                    v34 = v21;
                  v35 = v34;

                  ++v50;
                  v21 = v35;
                  goto LABEL_42;
                }
              }
              v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v51, v82, 16);
              if (v23)
                continue;
              break;
            }
            v5 = v25;
            v6 = v24;
            v9 = v44;
          }
LABEL_42:

          objc_msgSend(v9, "accessibilityElements");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (v50 - 1 >= (unint64_t)objc_msgSend(v36, "count"))
          {
            v37 = 0;
          }
          else
          {
            objc_msgSend(v36, "objectAtIndexedSubscript:");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v15, "tv_setProxyView:", v37);
          objc_msgSend(v37, "tv_setAssociatedIKViewElement:", v15);
          if (v21)
            objc_msgSend(v37, "setAccessibilityLabel:", v21);

        }
      }
      v12 = obj;
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v83, 16);
    }
    while (v13);
  }
  else
  {
    v50 = 0;
  }

  objc_msgSend(v9, "setTitleTextAttributes:forState:", v73[5], 0);
  objc_msgSend(v9, "setTitleTextAttributes:forState:", v61[5], 4);
  objc_msgSend(v9, "setTitleTextAttributes:forState:", v67[5], 8);
  objc_msgSend(v9, "setTitleTextAttributes:forState:", v67[5], 1);
  if (v50)
  {
    v38 = v50 - 1;
    if (v46 < v50 - 1)
      v38 = v46;
    if (v46 == -1)
      v39 = 0;
    else
      v39 = v38;
    objc_msgSend(v9, "setSelectedSegmentIndex:", v39);
  }
  +[_TVSegmentedControlTarget addTargetInSegmentedControl:withHighlightViewElements:](_TVSegmentedControlTarget, "addTargetInSegmentedControl:withHighlightViewElements:", v9, v43);

  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v66, 8);

  _Block_object_dispose(&v72, 8);
  _Block_object_dispose(&v78, 8);

  return v9;
}

void __60__TVMLViewFactory__segmentedControlForElement_existingView___block_invoke(_QWORD *a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  id obj;

  v3 = (objc_class *)MEMORY[0x24BDBCED8];
  v4 = a2;
  obj = objc_alloc_init(v3);
  objc_msgSend(v4, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "tv_textStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 || (objc_msgSend(v5, "tv_fontWeight"), (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_4:
    +[TVMLUtilities fontFromStyle:](TVMLUtilities, "fontFromStyle:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obj, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BDF65F8]);

    goto LABEL_5;
  }
  objc_msgSend(v5, "tv_fontSize");
  if (v23 > 0.0)
    goto LABEL_4;
LABEL_5:
  objc_msgSend(v5, "textShadow");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(obj, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BDF6640]);
  objc_msgSend(v5, "tv_color");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "color");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (uint64_t *)MEMORY[0x24BDF6600];
  if (v10)
    objc_msgSend(obj, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BDF6600]);
  objc_msgSend(v5, "tv_highlightColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "color");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(obj, "count") || v13)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), obj);
    v14 = objc_msgSend(obj, "mutableCopy");
    v15 = *(_QWORD *)(a1[5] + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    v17 = v13;
    if (!v13)
    {
      objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v18 = *v11;
    objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "setObject:forKeyedSubscript:", v17, *v11);
    if (!v13)

    v19 = objc_msgSend(obj, "mutableCopy");
    v20 = *(_QWORD *)(a1[6] + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v19;

    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setObject:forKeyedSubscript:", v22, v18);

    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
  }

}

- (id)_ratingBadgeFromElement:(id)a3 existingView:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  double v11;
  void *v12;

  v5 = a4;
  v6 = a3;
  +[TVRatingBadgeLayout layoutWithLayout:element:](TVRatingBadgeLayout, "layoutWithLayout:element:", 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("value"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatValue");
  v11 = v10;

  +[TVRatingBadgeView ratingBadgeViewWithValue:layout:existingBadgeView:](TVRatingBadgeView, "ratingBadgeViewWithValue:layout:existingBadgeView:", v7, v5, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_progressBarFromElement:(id)a3 existingView:(id)a4
{
  id v5;
  id v6;
  _TVProgressView *v7;
  _TVProgressView *v8;
  _TVProgressView *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  float v30;
  void *v31;
  void *v32;
  uint64_t v33;
  _OWORD v35[2];

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (_TVProgressView *)v6;
  }
  else
  {
    v8 = [_TVProgressView alloc];
    v7 = -[_TVProgressView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  }
  v9 = v7;
  objc_msgSend(v5, "style", TVCornerRadiiZero, 0, unk_222E77540);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "borderRadius");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    v13 = +[TVMLUtilities _cornerRadiiFromElement:cornerRadii:circle:](TVMLUtilities, "_cornerRadiiFromElement:cornerRadii:circle:", v5, v35, 0);

    if (v13)
    {
      +[TVCornerUtilities radiusFromCornerRadii:](TVCornerUtilities, "radiusFromCornerRadii:", v35[0], v35[1]);
      -[_TVProgressView setCornerRadius:](v9, "setCornerRadius:");
    }
  }
  else
  {

  }
  objc_msgSend(v5, "style");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "tv_progressStyle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[_TVProgressView setStyle:](v9, "setStyle:", objc_msgSend(v15, "isEqualToString:", CFSTR("unshadowed")));
  objc_msgSend(v5, "style");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "tv_tintColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "color");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    v20 = v18;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  v21 = v20;

  -[_TVProgressView setProgressTintColor:](v9, "setProgressTintColor:", v21);
  objc_msgSend(v5, "style");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "tv_tintColor2");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "color");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
  {
    v26 = v24;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.2, 0.9);
    v26 = (id)objc_claimAutoreleasedReturnValue();
  }
  v27 = v26;

  -[_TVProgressView setCompleteTintColor:](v9, "setCompleteTintColor:", v27);
  objc_msgSend(v5, "attributes");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("value"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "floatValue");
  -[_TVProgressView setProgress:](v9, "setProgress:", v30);

  objc_msgSend(v5, "style");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "tv_imageTreatment");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("blur"));

  -[_TVProgressView setUseMaterial:](v9, "setUseMaterial:", v33);
  return v9;
}

- (id)_seasonsBadgeWithElement:(id)a3 existingView:(id)a4
{
  id v5;
  id v6;
  _TVImageView *v7;
  _TVImageView *v8;
  _TVImageView *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  CGFloat v20;
  CGContext *CurrentContext;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  CGSize v27;

  v5 = a4;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (_TVImageView *)v5;
  }
  else
  {
    v8 = [_TVImageView alloc];
    v7 = -[_TVImageView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  }
  v9 = v7;
  v10 = (void *)MEMORY[0x24BDF6AC8];
  +[TVMLUtilities TVMLKitBundle](TVMLUtilities, "TVMLKitBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("seasons_mask"), v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "size");
  v14 = v13;
  v16 = v15;
  objc_msgSend(v6, "tv_attributedString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "scale");
  v20 = v19;
  v27.width = v14;
  v27.height = v16;
  UIGraphicsBeginImageContextWithOptions(v27, 0, v20);

  objc_msgSend(v12, "drawInRect:", 0.0, 0.0, v14, v16);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetBlendMode(CurrentContext, kCGBlendModeDestinationOut);
  objc_msgSend(v17, "drawInRect:", 0.0, 0.0, 43.0, 30.0);
  UIGraphicsGetImageFromCurrentImageContext();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  -[_TVImageView setImage:](v9, "setImage:", v22);
  -[_TVImageView setContentMode:](v9, "setContentMode:", 1);
  -[_TVImageView setContentsPosition:](v9, "setContentsPosition:", 2);
  objc_msgSend(v6, "style");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "tv_tintColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "color");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
    -[_TVImageView _setTintColor:](v9, "_setTintColor:", v25);

  return v9;
}

- (id)_separatorViewForElement:(id)a3 existingView:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  id v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    objc_msgSend(v7, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "subviews");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    objc_msgSend(v7, "contentView", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "subviews");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v37;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v37 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v16);
          if (v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            objc_msgSend(v17, "removeFromSuperview");
          else
            v10 = v17;
          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v14);
    }

    +[_TVSeparatorView separatorViewWithElement:existingView:](_TVSeparatorView, "separatorViewWithElement:existingView:", v5, v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "transferLayoutStylesFromElement:", v5);
    objc_msgSend(v18, "superview");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      objc_msgSend(v18, "setAutoresizingMask:", 18);
      objc_msgSend(v7, "contentView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addSubview:", v18);

    }
    objc_msgSend(v7, "contentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bounds");
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;
    objc_msgSend(v7, "tv_padding");
    objc_msgSend(v18, "setFrame:", v23 + v33, v25 + v30, v27 - (v33 + v31), v29 - (v30 + v32));

    v34 = v7;
  }
  else
  {
    +[_TVSeparatorView separatorViewWithElement:existingView:](_TVSeparatorView, "separatorViewWithElement:existingView:", v5, v6);
    v34 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "transferLayoutStylesFromElement:", v5);
  }

  return v34;
}

+ (void)imageViewWithElement:(void *)a1 layout:(void *)a2 existingView:.cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = OUTLINED_FUNCTION_5(a1);
  objc_msgSend(a2, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_222D98000, v5, v6, "width/height missing for element with URL [%@]", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_1_0();
}

- (void)_imageViewForBadgeElement:(void *)a1 existingView:(void *)a2 .cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = OUTLINED_FUNCTION_5(a1);
  objc_msgSend(a2, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_222D98000, v5, v6, "Can't find badge named [%@]", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_1_0();
}

- (void)_monogramViewForElement:(void *)a1 layout:(void *)a2 existingView:.cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;

  v3 = OUTLINED_FUNCTION_5(a1);
  objc_msgSend(a2, "attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "attributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("lastName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v5;
  v10 = 2112;
  v11 = v7;
  _os_log_error_impl(&dword_222D98000, v3, OS_LOG_TYPE_ERROR, "width/height missing for monogram with first,last [%@,%@]", (uint8_t *)&v8, 0x16u);

}

@end
