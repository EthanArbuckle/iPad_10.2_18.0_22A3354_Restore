@implementation SFHeadphoneProduct

- (SFHeadphoneProduct)initWithProductID:(unsigned int)a3 supportsMobileAsset:(BOOL)a4
{
  SFHeadphoneProduct *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFHeadphoneProduct;
  result = -[SFHeadphoneProduct init](&v7, sel_init);
  result->_supportsMobileAsset = a4;
  result->_productID = a3;
  result->_altProductID = -1;
  return result;
}

- (SFHeadphoneProduct)initWithModel:(unint64_t)a3
{
  uint64_t v4;
  SFHeadphoneProduct *v5;

  switch(a3)
  {
    case 1uLL:
      +[SFHeadphoneProduct airPods](SFHeadphoneProduct, "airPods");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 2uLL:
      +[SFHeadphoneProduct airPodsSecondGeneration](SFHeadphoneProduct, "airPodsSecondGeneration");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 3uLL:
      +[SFHeadphoneProduct airPodsPro](SFHeadphoneProduct, "airPodsPro");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 4uLL:
      +[SFHeadphoneProduct airPodsMax](SFHeadphoneProduct, "airPodsMax");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 5uLL:
      +[SFHeadphoneProduct beatsSolo](SFHeadphoneProduct, "beatsSolo");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 6uLL:
      +[SFHeadphoneProduct beatsSoloPro](SFHeadphoneProduct, "beatsSoloPro");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 7uLL:
      +[SFHeadphoneProduct beatsStudio](SFHeadphoneProduct, "beatsStudio");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 8uLL:
      +[SFHeadphoneProduct beatsX](SFHeadphoneProduct, "beatsX");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 9uLL:
      +[SFHeadphoneProduct beatsFlex](SFHeadphoneProduct, "beatsFlex");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 0xAuLL:
      +[SFHeadphoneProduct powerBeats3](SFHeadphoneProduct, "powerBeats3");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 0xBuLL:
      +[SFHeadphoneProduct powerBeats4](SFHeadphoneProduct, "powerBeats4");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 0xCuLL:
      +[SFHeadphoneProduct powerBeatsPro](SFHeadphoneProduct, "powerBeatsPro");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 0xDuLL:
      +[SFHeadphoneProduct b507](SFHeadphoneProduct, "b507");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 0xEuLL:
      +[SFHeadphoneProduct b688](SFHeadphoneProduct, "b688");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 0xFuLL:
      +[SFHeadphoneProduct b494](SFHeadphoneProduct, "b494");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 0x10uLL:
      +[SFHeadphoneProduct b607](SFHeadphoneProduct, "b607");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 0x11uLL:
      +[SFHeadphoneProduct b453](SFHeadphoneProduct, "b453");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 0x12uLL:
      +[SFHeadphoneProduct b465](SFHeadphoneProduct, "b465");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 0x13uLL:
      +[SFHeadphoneProduct b768e](SFHeadphoneProduct, "b768e");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 0x14uLL:
      +[SFHeadphoneProduct b768m](SFHeadphoneProduct, "b768m");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 0x15uLL:
      +[SFHeadphoneProduct b487](SFHeadphoneProduct, "b487");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 0x16uLL:
      +[SFHeadphoneProduct b498](SFHeadphoneProduct, "b498");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 0x17uLL:
      +[SFHeadphoneProduct b463](SFHeadphoneProduct, "b463");
      v4 = objc_claimAutoreleasedReturnValue();
LABEL_26:
      v5 = (SFHeadphoneProduct *)v4;
      break;
    default:
      v5 = 0;
      break;
  }

  return v5;
}

- (SFHeadphoneProduct)initWithBluetoothModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  int v41;
  SFHeadphoneProduct *v42;

  v4 = a3;
  +[SFHeadphoneProduct b507](SFHeadphoneProduct, "b507");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bluetoothModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  if (v7)
  {
    +[SFHeadphoneProduct b507](SFHeadphoneProduct, "b507");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[SFHeadphoneProduct b688](SFHeadphoneProduct, "b688");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bluetoothModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v4, "isEqualToString:", v10);

    if (v11)
    {
      +[SFHeadphoneProduct b688](SFHeadphoneProduct, "b688");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[SFHeadphoneProduct b494](SFHeadphoneProduct, "b494");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bluetoothModel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v4, "isEqualToString:", v13);

      if (v14)
      {
        +[SFHeadphoneProduct b494](SFHeadphoneProduct, "b494");
        v8 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        +[SFHeadphoneProduct b698](SFHeadphoneProduct, "b698");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "bluetoothModel");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v4, "isEqualToString:", v16);

        if (v17)
        {
          +[SFHeadphoneProduct b698](SFHeadphoneProduct, "b698");
          v8 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          +[SFHeadphoneProduct b607](SFHeadphoneProduct, "b607");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "bluetoothModel");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v4, "isEqualToString:", v19);

          if (v20)
          {
            +[SFHeadphoneProduct b607](SFHeadphoneProduct, "b607");
            v8 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            +[SFHeadphoneProduct b453](SFHeadphoneProduct, "b453");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "bluetoothModel");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v4, "isEqualToString:", v22);

            if (v23)
            {
              +[SFHeadphoneProduct b453](SFHeadphoneProduct, "b453");
              v8 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              +[SFHeadphoneProduct b465](SFHeadphoneProduct, "b465");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "bluetoothModel");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v4, "isEqualToString:", v25);

              if (v26)
              {
                +[SFHeadphoneProduct b465](SFHeadphoneProduct, "b465");
                v8 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                +[SFHeadphoneProduct b768e](SFHeadphoneProduct, "b768e");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "bluetoothModel");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = objc_msgSend(v4, "isEqualToString:", v28);

                if (v29)
                {
                  +[SFHeadphoneProduct b768e](SFHeadphoneProduct, "b768e");
                  v8 = objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  +[SFHeadphoneProduct b768m](SFHeadphoneProduct, "b768m");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v30, "bluetoothModel");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  v32 = objc_msgSend(v4, "isEqualToString:", v31);

                  if (v32)
                  {
                    +[SFHeadphoneProduct b768m](SFHeadphoneProduct, "b768m");
                    v8 = objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    +[SFHeadphoneProduct b487](SFHeadphoneProduct, "b487");
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v33, "bluetoothModel");
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    v35 = objc_msgSend(v4, "isEqualToString:", v34);

                    if (v35)
                    {
                      +[SFHeadphoneProduct b487](SFHeadphoneProduct, "b487");
                      v8 = objc_claimAutoreleasedReturnValue();
                    }
                    else
                    {
                      +[SFHeadphoneProduct b498](SFHeadphoneProduct, "b498");
                      v36 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v36, "bluetoothModel");
                      v37 = (void *)objc_claimAutoreleasedReturnValue();
                      v38 = objc_msgSend(v4, "isEqualToString:", v37);

                      if (v38)
                      {
                        +[SFHeadphoneProduct b498](SFHeadphoneProduct, "b498");
                        v8 = objc_claimAutoreleasedReturnValue();
                      }
                      else
                      {
                        +[SFHeadphoneProduct b463](SFHeadphoneProduct, "b463");
                        v39 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v39, "bluetoothModel");
                        v40 = (void *)objc_claimAutoreleasedReturnValue();
                        v41 = objc_msgSend(v4, "isEqualToString:", v40);

                        if (!v41)
                        {
                          v42 = 0;
                          goto LABEL_26;
                        }
                        +[SFHeadphoneProduct b463](SFHeadphoneProduct, "b463");
                        v8 = objc_claimAutoreleasedReturnValue();
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  v42 = (SFHeadphoneProduct *)v8;
LABEL_26:

  return v42;
}

- (SFHeadphoneProduct)initWithProductID:(unsigned int)a3
{
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  SFHeadphoneProduct *v16;
  SFHeadphoneProduct *v17;
  unsigned int v18;
  void *v19;
  int v20;
  SFHeadphoneProduct *v21;
  unsigned int v22;
  void *v23;
  int v24;
  SFHeadphoneProduct *v25;
  unsigned int v26;
  void *v27;
  int v28;
  void *v29;
  int v30;
  SFHeadphoneProduct *v31;
  unsigned int v32;
  void *v33;
  int v34;
  void *v35;
  int v36;
  void *v37;
  int v38;
  void *v39;
  int v40;
  void *v41;
  int v42;
  void *v43;
  int v44;

  +[SFHeadphoneProduct b507](SFHeadphoneProduct, "b507");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "productID");

  if (v6 == a3)
  {
    +[SFHeadphoneProduct b507](SFHeadphoneProduct, "b507");
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_35:
    v17 = (SFHeadphoneProduct *)v7;
    goto LABEL_36;
  }
  +[SFHeadphoneProduct b607](SFHeadphoneProduct, "b607");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "productID");

  if (v9 == a3)
  {
    +[SFHeadphoneProduct b607](SFHeadphoneProduct, "b607");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_35;
  }
  +[SFHeadphoneProduct b688](SFHeadphoneProduct, "b688");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "productID");

  if (v11 == a3)
  {
    +[SFHeadphoneProduct b688](SFHeadphoneProduct, "b688");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_35;
  }
  +[SFHeadphoneProduct b494](SFHeadphoneProduct, "b494");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "productID");

  if (v13 == a3)
  {
    +[SFHeadphoneProduct b494](SFHeadphoneProduct, "b494");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_35;
  }
  +[SFHeadphoneProduct b698](SFHeadphoneProduct, "b698");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "productID");

  +[SFHeadphoneProduct b698](SFHeadphoneProduct, "b698");
  v16 = (SFHeadphoneProduct *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v15 != a3)
  {
    v18 = -[SFHeadphoneProduct altProductID](v16, "altProductID");

    if (v18 == a3)
    {
      +[SFHeadphoneProduct b698](SFHeadphoneProduct, "b698");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_35;
    }
    +[SFHeadphoneProduct b768e](SFHeadphoneProduct, "b768e");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "productID");

    +[SFHeadphoneProduct b768e](SFHeadphoneProduct, "b768e");
    v21 = (SFHeadphoneProduct *)objc_claimAutoreleasedReturnValue();
    v17 = v21;
    if (v20 != a3)
    {
      v22 = -[SFHeadphoneProduct altProductID](v21, "altProductID");

      if (v22 == a3)
      {
        +[SFHeadphoneProduct b768e](SFHeadphoneProduct, "b768e");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_35;
      }
      +[SFHeadphoneProduct b768m](SFHeadphoneProduct, "b768m");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "productID");

      +[SFHeadphoneProduct b768m](SFHeadphoneProduct, "b768m");
      v25 = (SFHeadphoneProduct *)objc_claimAutoreleasedReturnValue();
      v17 = v25;
      if (v24 != a3)
      {
        v26 = -[SFHeadphoneProduct altProductID](v25, "altProductID");

        if (v26 == a3)
        {
          +[SFHeadphoneProduct b768m](SFHeadphoneProduct, "b768m");
          v7 = objc_claimAutoreleasedReturnValue();
          goto LABEL_35;
        }
        +[SFHeadphoneProduct airPodsPro](SFHeadphoneProduct, "airPodsPro");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "productID");

        if (v28 == a3)
        {
          +[SFHeadphoneProduct airPodsPro](SFHeadphoneProduct, "airPodsPro");
          v7 = objc_claimAutoreleasedReturnValue();
          goto LABEL_35;
        }
        +[SFHeadphoneProduct airPodsMax](SFHeadphoneProduct, "airPodsMax");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "altProductID");

        +[SFHeadphoneProduct airPodsMax](SFHeadphoneProduct, "airPodsMax");
        v31 = (SFHeadphoneProduct *)objc_claimAutoreleasedReturnValue();
        v17 = v31;
        if (v30 != a3)
        {
          v32 = -[SFHeadphoneProduct productID](v31, "productID");

          if (v32 == a3)
          {
            +[SFHeadphoneProduct airPodsMax](SFHeadphoneProduct, "airPodsMax");
            v7 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            +[SFHeadphoneProduct powerBeatsPro](SFHeadphoneProduct, "powerBeatsPro");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v33, "productID");

            if (v34 == a3)
            {
              +[SFHeadphoneProduct powerBeatsPro](SFHeadphoneProduct, "powerBeatsPro");
              v7 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              +[SFHeadphoneProduct b453](SFHeadphoneProduct, "b453");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = objc_msgSend(v35, "productID");

              if (v36 == a3)
              {
                +[SFHeadphoneProduct b453](SFHeadphoneProduct, "b453");
                v7 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                +[SFHeadphoneProduct b465](SFHeadphoneProduct, "b465");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = objc_msgSend(v37, "productID");

                if (v38 == a3)
                {
                  +[SFHeadphoneProduct b465](SFHeadphoneProduct, "b465");
                  v7 = objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  +[SFHeadphoneProduct b487](SFHeadphoneProduct, "b487");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  v40 = objc_msgSend(v39, "productID");

                  if (v40 == a3)
                  {
                    +[SFHeadphoneProduct b487](SFHeadphoneProduct, "b487");
                    v7 = objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    +[SFHeadphoneProduct b498](SFHeadphoneProduct, "b498");
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    v42 = objc_msgSend(v41, "productID");

                    if (v42 == a3)
                    {
                      +[SFHeadphoneProduct b498](SFHeadphoneProduct, "b498");
                      v7 = objc_claimAutoreleasedReturnValue();
                    }
                    else
                    {
                      +[SFHeadphoneProduct b463](SFHeadphoneProduct, "b463");
                      v43 = (void *)objc_claimAutoreleasedReturnValue();
                      v44 = objc_msgSend(v43, "productID");

                      if (v44 != a3)
                      {
                        v17 = 0;
                        goto LABEL_36;
                      }
                      +[SFHeadphoneProduct b463](SFHeadphoneProduct, "b463");
                      v7 = objc_claimAutoreleasedReturnValue();
                    }
                  }
                }
              }
            }
          }
          goto LABEL_35;
        }
      }
    }
  }
LABEL_36:

  return v17;
}

+ (SFHeadphoneProduct)airPods
{
  if (airPods_onceToken != -1)
    dispatch_once(&airPods_onceToken, &__block_literal_global_37);
  return (SFHeadphoneProduct *)(id)airPods_airPods;
}

uint64_t __29__SFHeadphoneProduct_airPods__block_invoke()
{
  SFHeadphoneProduct *v0;
  void *v1;

  v0 = -[SFHeadphoneProduct initWithProductID:supportsMobileAsset:]([SFHeadphoneProduct alloc], "initWithProductID:supportsMobileAsset:", 8194, 1);
  v1 = (void *)airPods_airPods;
  airPods_airPods = (uint64_t)v0;

  objc_msgSend((id)airPods_airPods, "setBluetoothModel:", CFSTR("AirPods1,1"));
  objc_msgSend((id)airPods_airPods, "setModel:", 1);
  objc_msgSend((id)airPods_airPods, "setSupportsSiri:", 1);
  objc_msgSend((id)airPods_airPods, "setSupportsRepair:", 1);
  objc_msgSend((id)airPods_airPods, "setSupportsSpatialAudio:", 1);
  objc_msgSend((id)airPods_airPods, "setSupportsCounterfeitDetection:", 1);
  objc_msgSend((id)airPods_airPods, "setShowsStatus:", 1);
  objc_msgSend((id)airPods_airPods, "setHasAddressInAdvertisement:", 1);
  objc_msgSend((id)airPods_airPods, "setHasSplitBattery:", 1);
  objc_msgSend((id)airPods_airPods, "setHasW1Chip:", 1);
  objc_msgSend((id)airPods_airPods, "setHasLid:", 1);
  objc_msgSend((id)airPods_airPods, "setButtonLocation:", 1);
  return objc_msgSend((id)airPods_airPods, "setIsAirPods:", 1);
}

+ (SFHeadphoneProduct)airPodsSecondGeneration
{
  if (airPodsSecondGeneration_onceToken != -1)
    dispatch_once(&airPodsSecondGeneration_onceToken, &__block_literal_global_2_0);
  return (SFHeadphoneProduct *)(id)airPodsSecondGeneration_airPods;
}

uint64_t __45__SFHeadphoneProduct_airPodsSecondGeneration__block_invoke()
{
  SFHeadphoneProduct *v0;
  void *v1;

  v0 = -[SFHeadphoneProduct initWithProductID:supportsMobileAsset:]([SFHeadphoneProduct alloc], "initWithProductID:supportsMobileAsset:", 8207, 1);
  v1 = (void *)airPodsSecondGeneration_airPods;
  airPodsSecondGeneration_airPods = (uint64_t)v0;

  objc_msgSend((id)airPodsSecondGeneration_airPods, "setBluetoothModel:", CFSTR("AirPods1,3"));
  objc_msgSend((id)airPodsSecondGeneration_airPods, "setModel:", 2);
  objc_msgSend((id)airPodsSecondGeneration_airPods, "setSupportsSiri:", 1);
  objc_msgSend((id)airPodsSecondGeneration_airPods, "setSupportsRepair:", 1);
  objc_msgSend((id)airPodsSecondGeneration_airPods, "setSupportsSpatialAudio:", 1);
  objc_msgSend((id)airPodsSecondGeneration_airPods, "setSupportsCounterfeitDetection:", 1);
  objc_msgSend((id)airPodsSecondGeneration_airPods, "setShowsStatus:", 1);
  objc_msgSend((id)airPodsSecondGeneration_airPods, "setHasAddressInAdvertisement:", 1);
  objc_msgSend((id)airPodsSecondGeneration_airPods, "setHasSplitBattery:", 1);
  objc_msgSend((id)airPodsSecondGeneration_airPods, "setHasLid:", 1);
  objc_msgSend((id)airPodsSecondGeneration_airPods, "setButtonLocation:", 1);
  return objc_msgSend((id)airPodsSecondGeneration_airPods, "setIsAirPods:", 1);
}

+ (SFHeadphoneProduct)b688
{
  if (b688_onceToken[0] != -1)
    dispatch_once(b688_onceToken, &__block_literal_global_5);
  return (SFHeadphoneProduct *)(id)b688_b688;
}

uint64_t __26__SFHeadphoneProduct_b688__block_invoke()
{
  SFHeadphoneProduct *v0;
  void *v1;

  v0 = -[SFHeadphoneProduct initWithProductID:supportsMobileAsset:]([SFHeadphoneProduct alloc], "initWithProductID:supportsMobileAsset:", 8211, 1);
  v1 = (void *)b688_b688;
  b688_b688 = (uint64_t)v0;

  objc_msgSend((id)b688_b688, "setBluetoothModel:", CFSTR("Device1,8211"));
  objc_msgSend((id)b688_b688, "setModel:", 14);
  objc_msgSend((id)b688_b688, "setSupportsSiri:", 1);
  objc_msgSend((id)b688_b688, "setSupportsRepair:", 1);
  objc_msgSend((id)b688_b688, "setSupportsSpatialAudio:", 1);
  objc_msgSend((id)b688_b688, "setSupportsOptimizedBatteryCharging:", 1);
  objc_msgSend((id)b688_b688, "setSupportsFindMyNetwork:", 1);
  objc_msgSend((id)b688_b688, "setSupportsCounterfeitDetection:", 1);
  objc_msgSend((id)b688_b688, "setSupportsMuteCallProx:", 1);
  objc_msgSend((id)b688_b688, "setShowsStatus:", 1);
  objc_msgSend((id)b688_b688, "setHasAddressInAdvertisement:", 1);
  objc_msgSend((id)b688_b688, "setHasSplitBattery:", 1);
  objc_msgSend((id)b688_b688, "setHasLid:", 1);
  objc_msgSend((id)b688_b688, "setButtonLocation:", 1);
  return objc_msgSend((id)b688_b688, "setIsAirPods:", 1);
}

+ (SFHeadphoneProduct)b768e
{
  if (b768e_onceToken != -1)
    dispatch_once(&b768e_onceToken, &__block_literal_global_8);
  return (SFHeadphoneProduct *)(id)b768e_b768e;
}

uint64_t __27__SFHeadphoneProduct_b768e__block_invoke()
{
  SFHeadphoneProduct *v0;
  void *v1;

  v0 = -[SFHeadphoneProduct initWithProductID:supportsMobileAsset:]([SFHeadphoneProduct alloc], "initWithProductID:supportsMobileAsset:", 8217, 1);
  v1 = (void *)b768e_b768e;
  b768e_b768e = (uint64_t)v0;

  objc_msgSend((id)b768e_b768e, "setAltProductID:", 8222);
  objc_msgSend((id)b768e_b768e, "setBluetoothModel:", CFSTR("Device1,8217"));
  objc_msgSend((id)b768e_b768e, "setModel:", 19);
  objc_msgSend((id)b768e_b768e, "setSupportsSiri:", 1);
  objc_msgSend((id)b768e_b768e, "setSupportsRepair:", 1);
  objc_msgSend((id)b768e_b768e, "setSupportsSpatialAudio:", 1);
  objc_msgSend((id)b768e_b768e, "setSupportsOptimizedBatteryCharging:", 1);
  objc_msgSend((id)b768e_b768e, "setSupportsFindMyNetwork:", 1);
  objc_msgSend((id)b768e_b768e, "setSupportsCounterfeitDetection:", 1);
  objc_msgSend((id)b768e_b768e, "setSupportsDigitalEngraving:", 1);
  objc_msgSend((id)b768e_b768e, "setIgnoresBatteryStatusIfCounterfeit:", 1);
  objc_msgSend((id)b768e_b768e, "setShowsStatus:", 1);
  objc_msgSend((id)b768e_b768e, "setHasAddressInAdvertisement:", 1);
  objc_msgSend((id)b768e_b768e, "setHasSplitBattery:", 1);
  objc_msgSend((id)b768e_b768e, "setHasLid:", 1);
  objc_msgSend((id)b768e_b768e, "setButtonLocation:", 1);
  return objc_msgSend((id)b768e_b768e, "setIsAirPods:", 1);
}

+ (SFHeadphoneProduct)b768m
{
  if (b768m_onceToken != -1)
    dispatch_once(&b768m_onceToken, &__block_literal_global_11);
  return (SFHeadphoneProduct *)(id)b768m_b768m;
}

uint64_t __27__SFHeadphoneProduct_b768m__block_invoke()
{
  SFHeadphoneProduct *v0;
  void *v1;

  v0 = -[SFHeadphoneProduct initWithProductID:supportsMobileAsset:]([SFHeadphoneProduct alloc], "initWithProductID:supportsMobileAsset:", 8219, 1);
  v1 = (void *)b768m_b768m;
  b768m_b768m = (uint64_t)v0;

  objc_msgSend((id)b768m_b768m, "setAltProductID:", 8224);
  objc_msgSend((id)b768m_b768m, "setBluetoothModel:", CFSTR("Device1,8219"));
  objc_msgSend((id)b768m_b768m, "setModel:", 20);
  objc_msgSend((id)b768m_b768m, "setSupportsSiri:", 1);
  objc_msgSend((id)b768m_b768m, "setSupportsRepair:", 1);
  objc_msgSend((id)b768m_b768m, "setSupportsSpatialAudio:", 1);
  objc_msgSend((id)b768m_b768m, "setSupportsOptimizedBatteryCharging:", 1);
  objc_msgSend((id)b768m_b768m, "setSupportsFindMyNetwork:", 1);
  objc_msgSend((id)b768m_b768m, "setSupportsCounterfeitDetection:", 1);
  objc_msgSend((id)b768m_b768m, "setSupportsDigitalEngraving:", 1);
  objc_msgSend((id)b768m_b768m, "setIgnoresBatteryStatusIfCounterfeit:", 1);
  objc_msgSend((id)b768m_b768m, "setShowsStatus:", 1);
  objc_msgSend((id)b768m_b768m, "setHasAddressInAdvertisement:", 1);
  objc_msgSend((id)b768m_b768m, "setHasSplitBattery:", 1);
  objc_msgSend((id)b768m_b768m, "setHasLid:", 1);
  objc_msgSend((id)b768m_b768m, "setHasCaseBT:", 1);
  objc_msgSend((id)b768m_b768m, "setButtonLocation:", 1);
  return objc_msgSend((id)b768m_b768m, "setIsAirPods:", 1);
}

+ (SFHeadphoneProduct)airPodsPro
{
  if (airPodsPro_onceToken != -1)
    dispatch_once(&airPodsPro_onceToken, &__block_literal_global_14);
  return (SFHeadphoneProduct *)(id)airPodsPro_airPodsPro;
}

uint64_t __32__SFHeadphoneProduct_airPodsPro__block_invoke()
{
  SFHeadphoneProduct *v0;
  void *v1;

  v0 = -[SFHeadphoneProduct initWithProductID:supportsMobileAsset:]([SFHeadphoneProduct alloc], "initWithProductID:supportsMobileAsset:", 8206, 1);
  v1 = (void *)airPodsPro_airPodsPro;
  airPodsPro_airPodsPro = (uint64_t)v0;

  objc_msgSend((id)airPodsPro_airPodsPro, "setBluetoothModel:", CFSTR("AirPodsPro1,1"));
  objc_msgSend((id)airPodsPro_airPodsPro, "setModel:", 3);
  objc_msgSend((id)airPodsPro_airPodsPro, "setSupportsSiri:", 1);
  objc_msgSend((id)airPodsPro_airPodsPro, "setSupportsRepair:", 1);
  objc_msgSend((id)airPodsPro_airPodsPro, "setSupportsSpatialAudio:", 1);
  objc_msgSend((id)airPodsPro_airPodsPro, "setSupportsOptimizedBatteryCharging:", 1);
  objc_msgSend((id)airPodsPro_airPodsPro, "setSupportsFindMyNetwork:", 1);
  objc_msgSend((id)airPodsPro_airPodsPro, "setSupportsCounterfeitDetection:", 1);
  objc_msgSend((id)airPodsPro_airPodsPro, "setSupportsMuteCallProx:", 1);
  objc_msgSend((id)airPodsPro_airPodsPro, "setShowsStatus:", 1);
  objc_msgSend((id)airPodsPro_airPodsPro, "setHasAddressInAdvertisement:", 1);
  objc_msgSend((id)airPodsPro_airPodsPro, "setHasSplitBattery:", 1);
  objc_msgSend((id)airPodsPro_airPodsPro, "setHasLid:", 1);
  objc_msgSend((id)airPodsPro_airPodsPro, "setButtonLocation:", 1);
  return objc_msgSend((id)airPodsPro_airPodsPro, "setIsAirPods:", 1);
}

+ (SFHeadphoneProduct)b698
{
  if (b698_onceToken != -1)
    dispatch_once(&b698_onceToken, &__block_literal_global_17);
  return (SFHeadphoneProduct *)(id)b698_airPodsPro;
}

uint64_t __26__SFHeadphoneProduct_b698__block_invoke()
{
  SFHeadphoneProduct *v0;
  void *v1;

  v0 = -[SFHeadphoneProduct initWithProductID:supportsMobileAsset:]([SFHeadphoneProduct alloc], "initWithProductID:supportsMobileAsset:", 8212, 1);
  v1 = (void *)b698_airPodsPro;
  b698_airPodsPro = (uint64_t)v0;

  objc_msgSend((id)b698_airPodsPro, "setAltProductID:", 8228);
  objc_msgSend((id)b698_airPodsPro, "setBluetoothModel:", CFSTR("Device1,8212"));
  objc_msgSend((id)b698_airPodsPro, "setModel:", 3);
  objc_msgSend((id)b698_airPodsPro, "setSupportsSiri:", 1);
  objc_msgSend((id)b698_airPodsPro, "setSupportsRepair:", 1);
  objc_msgSend((id)b698_airPodsPro, "setSupportsSpatialAudio:", 1);
  objc_msgSend((id)b698_airPodsPro, "setSupportsOptimizedBatteryCharging:", 1);
  objc_msgSend((id)b698_airPodsPro, "setSupportsFindMyNetwork:", 1);
  objc_msgSend((id)b698_airPodsPro, "setSupportsCounterfeitDetection:", 1);
  objc_msgSend((id)b698_airPodsPro, "setIgnoresBatteryStatusIfCounterfeit:", 1);
  objc_msgSend((id)b698_airPodsPro, "setSupportsDigitalEngraving:", 1);
  objc_msgSend((id)b698_airPodsPro, "setSupportsMuteCallProx:", 1);
  objc_msgSend((id)b698_airPodsPro, "setSupportsAdaptiveControlsProx:", 1);
  objc_msgSend((id)b698_airPodsPro, "setShowsStatus:", 1);
  objc_msgSend((id)b698_airPodsPro, "setHasSplitBattery:", 1);
  objc_msgSend((id)b698_airPodsPro, "setHasLid:", 1);
  objc_msgSend((id)b698_airPodsPro, "setHasCaseBT:", 1);
  objc_msgSend((id)b698_airPodsPro, "setButtonLocation:", 1);
  return objc_msgSend((id)b698_airPodsPro, "setIsAirPods:", 1);
}

+ (SFHeadphoneProduct)airPodsMax
{
  if (airPodsMax_onceToken != -1)
    dispatch_once(&airPodsMax_onceToken, &__block_literal_global_20);
  return (SFHeadphoneProduct *)(id)airPodsMax_airPodsMax;
}

uint64_t __32__SFHeadphoneProduct_airPodsMax__block_invoke()
{
  SFHeadphoneProduct *v0;
  void *v1;

  v0 = -[SFHeadphoneProduct initWithProductID:supportsMobileAsset:]([SFHeadphoneProduct alloc], "initWithProductID:supportsMobileAsset:", 8202, 1);
  v1 = (void *)airPodsMax_airPodsMax;
  airPodsMax_airPodsMax = (uint64_t)v0;

  objc_msgSend((id)airPodsMax_airPodsMax, "setAltProductID:", 8223);
  objc_msgSend((id)airPodsMax_airPodsMax, "setBluetoothModel:", CFSTR("Device1,8202"));
  objc_msgSend((id)airPodsMax_airPodsMax, "setModel:", 4);
  objc_msgSend((id)airPodsMax_airPodsMax, "setSupportsSiri:", 1);
  objc_msgSend((id)airPodsMax_airPodsMax, "setSupportsRepair:", 1);
  objc_msgSend((id)airPodsMax_airPodsMax, "setSupportsSpatialAudio:", 1);
  objc_msgSend((id)airPodsMax_airPodsMax, "setSupportsFindMyNetwork:", 1);
  objc_msgSend((id)airPodsMax_airPodsMax, "setSupportsCounterfeitDetection:", 1);
  objc_msgSend((id)airPodsMax_airPodsMax, "setSupportsMuteCallProx:", 1);
  objc_msgSend((id)airPodsMax_airPodsMax, "setHasAddressInAdvertisement:", 1);
  objc_msgSend((id)airPodsMax_airPodsMax, "setShowsStatus:", 1);
  return objc_msgSend((id)airPodsMax_airPodsMax, "setButtonLocation:", 2);
}

+ (SFHeadphoneProduct)beatsSolo
{
  if (beatsSolo_onceToken != -1)
    dispatch_once(&beatsSolo_onceToken, &__block_literal_global_23);
  return (SFHeadphoneProduct *)(id)beatsSolo_beatsSolo;
}

uint64_t __31__SFHeadphoneProduct_beatsSolo__block_invoke()
{
  SFHeadphoneProduct *v0;
  void *v1;

  v0 = -[SFHeadphoneProduct initWithProductID:supportsMobileAsset:]([SFHeadphoneProduct alloc], "initWithProductID:supportsMobileAsset:", 8198, 1);
  v1 = (void *)beatsSolo_beatsSolo;
  beatsSolo_beatsSolo = (uint64_t)v0;

  objc_msgSend((id)beatsSolo_beatsSolo, "setBluetoothModel:", CFSTR("BeatsSolo3,1"));
  objc_msgSend((id)beatsSolo_beatsSolo, "setModel:", 5);
  objc_msgSend((id)beatsSolo_beatsSolo, "setSupportsSiri:", 1);
  objc_msgSend((id)beatsSolo_beatsSolo, "setSupportsRepair:", 1);
  objc_msgSend((id)beatsSolo_beatsSolo, "setHasAddressInAdvertisement:", 1);
  objc_msgSend((id)beatsSolo_beatsSolo, "setHasW1Chip:", 1);
  return objc_msgSend((id)beatsSolo_beatsSolo, "setButtonLocation:", 2);
}

+ (SFHeadphoneProduct)beatsSoloPro
{
  if (beatsSoloPro_onceToken != -1)
    dispatch_once(&beatsSoloPro_onceToken, &__block_literal_global_26);
  return (SFHeadphoneProduct *)(id)beatsSoloPro_beatsSoloPro;
}

uint64_t __34__SFHeadphoneProduct_beatsSoloPro__block_invoke()
{
  SFHeadphoneProduct *v0;
  void *v1;

  v0 = -[SFHeadphoneProduct initWithProductID:supportsMobileAsset:]([SFHeadphoneProduct alloc], "initWithProductID:supportsMobileAsset:", 8204, 1);
  v1 = (void *)beatsSoloPro_beatsSoloPro;
  beatsSoloPro_beatsSoloPro = (uint64_t)v0;

  objc_msgSend((id)beatsSoloPro_beatsSoloPro, "setBluetoothModel:", CFSTR("BeatsSoloPro1,1"));
  objc_msgSend((id)beatsSoloPro_beatsSoloPro, "setModel:", 6);
  objc_msgSend((id)beatsSoloPro_beatsSoloPro, "setSupportsSiri:", 1);
  objc_msgSend((id)beatsSoloPro_beatsSoloPro, "setHasAddressInAdvertisement:", 1);
  objc_msgSend((id)beatsSoloPro_beatsSoloPro, "setShowsStatusOutOfCase:", 1);
  return objc_msgSend((id)beatsSoloPro_beatsSoloPro, "setButtonLocation:", 2);
}

+ (SFHeadphoneProduct)beatsStudio
{
  if (beatsStudio_onceToken != -1)
    dispatch_once(&beatsStudio_onceToken, &__block_literal_global_29);
  return (SFHeadphoneProduct *)(id)beatsStudio_beatsStudio;
}

uint64_t __33__SFHeadphoneProduct_beatsStudio__block_invoke()
{
  SFHeadphoneProduct *v0;
  void *v1;

  v0 = -[SFHeadphoneProduct initWithProductID:supportsMobileAsset:]([SFHeadphoneProduct alloc], "initWithProductID:supportsMobileAsset:", 8201, 1);
  v1 = (void *)beatsStudio_beatsStudio;
  beatsStudio_beatsStudio = (uint64_t)v0;

  objc_msgSend((id)beatsStudio_beatsStudio, "setBluetoothModel:", CFSTR("BeatsStudio3,2"));
  objc_msgSend((id)beatsStudio_beatsStudio, "setModel:", 7);
  objc_msgSend((id)beatsStudio_beatsStudio, "setSupportsRepair:", 1);
  objc_msgSend((id)beatsStudio_beatsStudio, "setHasAddressInAdvertisement:", 1);
  objc_msgSend((id)beatsStudio_beatsStudio, "setHasW1Chip:", 1);
  return objc_msgSend((id)beatsStudio_beatsStudio, "setButtonLocation:", 2);
}

+ (SFHeadphoneProduct)b453
{
  if (b453_onceToken != -1)
    dispatch_once(&b453_onceToken, &__block_literal_global_32);
  return (SFHeadphoneProduct *)(id)b453_b453;
}

uint64_t __26__SFHeadphoneProduct_b453__block_invoke()
{
  SFHeadphoneProduct *v0;
  void *v1;

  v0 = -[SFHeadphoneProduct initWithProductID:supportsMobileAsset:]([SFHeadphoneProduct alloc], "initWithProductID:supportsMobileAsset:", 8215, 1);
  v1 = (void *)b453_b453;
  b453_b453 = (uint64_t)v0;

  objc_msgSend((id)b453_b453, "setBluetoothModel:", CFSTR("Device1,8215"));
  objc_msgSend((id)b453_b453, "setModel:", 17);
  objc_msgSend((id)b453_b453, "setSupportsSiri:", 1);
  objc_msgSend((id)b453_b453, "setSupportsRepair:", 1);
  objc_msgSend((id)b453_b453, "setSupportsEndCallProx:", 1);
  objc_msgSend((id)b453_b453, "setHasAddressInAdvertisement:", 1);
  objc_msgSend((id)b453_b453, "setHasW1Chip:", 1);
  return objc_msgSend((id)b453_b453, "setButtonLocation:", 2);
}

+ (SFHeadphoneProduct)b465
{
  if (b465_onceToken != -1)
    dispatch_once(&b465_onceToken, &__block_literal_global_35);
  return (SFHeadphoneProduct *)(id)b465_b465;
}

uint64_t __26__SFHeadphoneProduct_b465__block_invoke()
{
  SFHeadphoneProduct *v0;
  void *v1;

  v0 = -[SFHeadphoneProduct initWithProductID:supportsMobileAsset:]([SFHeadphoneProduct alloc], "initWithProductID:supportsMobileAsset:", 8229, 1);
  v1 = (void *)b465_b465;
  b465_b465 = (uint64_t)v0;

  objc_msgSend((id)b465_b465, "setBluetoothModel:", CFSTR("Device1,8229"));
  objc_msgSend((id)b465_b465, "setModel:", 18);
  objc_msgSend((id)b465_b465, "setSupportsSiri:", 1);
  objc_msgSend((id)b465_b465, "setSupportsRepair:", 1);
  objc_msgSend((id)b465_b465, "setSupportsEndCallProx:", 1);
  objc_msgSend((id)b465_b465, "setSupportsMuteCallProx:", 1);
  objc_msgSend((id)b465_b465, "setHasAddressInAdvertisement:", 1);
  objc_msgSend((id)b465_b465, "setHasW1Chip:", 1);
  return objc_msgSend((id)b465_b465, "setButtonLocation:", 2);
}

+ (SFHeadphoneProduct)b487
{
  if (b487_onceToken != -1)
    dispatch_once(&b487_onceToken, &__block_literal_global_38);
  return (SFHeadphoneProduct *)(id)b487_b487;
}

uint64_t __26__SFHeadphoneProduct_b487__block_invoke()
{
  SFHeadphoneProduct *v0;
  void *v1;

  v0 = -[SFHeadphoneProduct initWithProductID:supportsMobileAsset:]([SFHeadphoneProduct alloc], "initWithProductID:supportsMobileAsset:", 8218, 1);
  v1 = (void *)b487_b487;
  b487_b487 = (uint64_t)v0;

  objc_msgSend((id)b487_b487, "setBluetoothModel:", CFSTR("Device1,8218"));
  objc_msgSend((id)b487_b487, "setModel:", 21);
  objc_msgSend((id)b487_b487, "setSupportsRepair:", 1);
  objc_msgSend((id)b487_b487, "setSupportsEndCallProx:", 1);
  objc_msgSend((id)b487_b487, "setSupportsMuteCallProx:", 1);
  objc_msgSend((id)b487_b487, "setHasAddressInAdvertisement:", 1);
  objc_msgSend((id)b487_b487, "setHasW1Chip:", 1);
  return objc_msgSend((id)b487_b487, "setButtonLocation:", 2);
}

+ (SFHeadphoneProduct)beatsX
{
  if (beatsX_onceToken != -1)
    dispatch_once(&beatsX_onceToken, &__block_literal_global_41);
  return (SFHeadphoneProduct *)(id)beatsX_beatsX;
}

uint64_t __28__SFHeadphoneProduct_beatsX__block_invoke()
{
  SFHeadphoneProduct *v0;
  void *v1;

  v0 = -[SFHeadphoneProduct initWithProductID:supportsMobileAsset:]([SFHeadphoneProduct alloc], "initWithProductID:supportsMobileAsset:", 8197, 1);
  v1 = (void *)beatsX_beatsX;
  beatsX_beatsX = (uint64_t)v0;

  objc_msgSend((id)beatsX_beatsX, "setBluetoothModel:", CFSTR("BeatsX1,1"));
  objc_msgSend((id)beatsX_beatsX, "setModel:", 8);
  objc_msgSend((id)beatsX_beatsX, "setSupportsRepair:", 1);
  objc_msgSend((id)beatsX_beatsX, "setHasAddressInAdvertisement:", 1);
  objc_msgSend((id)beatsX_beatsX, "setHasW1Chip:", 1);
  return objc_msgSend((id)beatsX_beatsX, "setButtonLocation:", 2);
}

+ (SFHeadphoneProduct)beatsFlex
{
  if (beatsFlex_onceToken != -1)
    dispatch_once(&beatsFlex_onceToken, &__block_literal_global_44);
  return (SFHeadphoneProduct *)(id)beatsFlex_beatsFlex;
}

uint64_t __31__SFHeadphoneProduct_beatsFlex__block_invoke()
{
  SFHeadphoneProduct *v0;
  void *v1;

  v0 = -[SFHeadphoneProduct initWithProductID:supportsMobileAsset:]([SFHeadphoneProduct alloc], "initWithProductID:supportsMobileAsset:", 8208, 1);
  v1 = (void *)beatsFlex_beatsFlex;
  beatsFlex_beatsFlex = (uint64_t)v0;

  objc_msgSend((id)beatsFlex_beatsFlex, "setBluetoothModel:", CFSTR("Device1,8208"));
  objc_msgSend((id)beatsFlex_beatsFlex, "setModel:", 9);
  objc_msgSend((id)beatsFlex_beatsFlex, "setSupportsRepair:", 1);
  objc_msgSend((id)beatsFlex_beatsFlex, "setSupportsWirelessSplitterInEar:", 1);
  objc_msgSend((id)beatsFlex_beatsFlex, "setHasAddressInAdvertisement:", 1);
  objc_msgSend((id)beatsFlex_beatsFlex, "setHasW1Chip:", 1);
  return objc_msgSend((id)beatsFlex_beatsFlex, "setButtonLocation:", 2);
}

+ (SFHeadphoneProduct)powerBeats3
{
  if (powerBeats3_onceToken != -1)
    dispatch_once(&powerBeats3_onceToken, &__block_literal_global_47);
  return (SFHeadphoneProduct *)(id)powerBeats3_powerBeats3;
}

uint64_t __33__SFHeadphoneProduct_powerBeats3__block_invoke()
{
  SFHeadphoneProduct *v0;
  void *v1;

  v0 = -[SFHeadphoneProduct initWithProductID:supportsMobileAsset:]([SFHeadphoneProduct alloc], "initWithProductID:supportsMobileAsset:", 8195, 1);
  v1 = (void *)powerBeats3_powerBeats3;
  powerBeats3_powerBeats3 = (uint64_t)v0;

  objc_msgSend((id)powerBeats3_powerBeats3, "setBluetoothModel:", CFSTR("PowerBeats3,1"));
  objc_msgSend((id)powerBeats3_powerBeats3, "setModel:", 10);
  objc_msgSend((id)powerBeats3_powerBeats3, "setSupportsRepair:", 1);
  objc_msgSend((id)powerBeats3_powerBeats3, "setHasAddressInAdvertisement:", 1);
  objc_msgSend((id)powerBeats3_powerBeats3, "setHasW1Chip:", 1);
  return objc_msgSend((id)powerBeats3_powerBeats3, "setButtonLocation:", 2);
}

+ (SFHeadphoneProduct)powerBeats4
{
  if (powerBeats4_onceToken != -1)
    dispatch_once(&powerBeats4_onceToken, &__block_literal_global_50);
  return (SFHeadphoneProduct *)(id)powerBeats4_powerBeats4;
}

uint64_t __33__SFHeadphoneProduct_powerBeats4__block_invoke()
{
  SFHeadphoneProduct *v0;
  void *v1;

  v0 = -[SFHeadphoneProduct initWithProductID:supportsMobileAsset:]([SFHeadphoneProduct alloc], "initWithProductID:supportsMobileAsset:", 8205, 1);
  v1 = (void *)powerBeats4_powerBeats4;
  powerBeats4_powerBeats4 = (uint64_t)v0;

  objc_msgSend((id)powerBeats4_powerBeats4, "setBluetoothModel:", CFSTR("Powerbeats4,1"));
  objc_msgSend((id)powerBeats4_powerBeats4, "setModel:", 11);
  objc_msgSend((id)powerBeats4_powerBeats4, "setHasAddressInAdvertisement:", 1);
  objc_msgSend((id)powerBeats4_powerBeats4, "setSupportsRepair:", 1);
  objc_msgSend((id)powerBeats4_powerBeats4, "setShowsStatusOutOfCase:", 1);
  return objc_msgSend((id)powerBeats4_powerBeats4, "setButtonLocation:", 2);
}

+ (SFHeadphoneProduct)powerBeatsPro
{
  if (powerBeatsPro_onceToken != -1)
    dispatch_once(&powerBeatsPro_onceToken, &__block_literal_global_53);
  return (SFHeadphoneProduct *)(id)powerBeatsPro_powerBeatsPro;
}

uint64_t __35__SFHeadphoneProduct_powerBeatsPro__block_invoke()
{
  SFHeadphoneProduct *v0;
  void *v1;

  v0 = -[SFHeadphoneProduct initWithProductID:supportsMobileAsset:]([SFHeadphoneProduct alloc], "initWithProductID:supportsMobileAsset:", 8203, 1);
  v1 = (void *)powerBeatsPro_powerBeatsPro;
  powerBeatsPro_powerBeatsPro = (uint64_t)v0;

  objc_msgSend((id)powerBeatsPro_powerBeatsPro, "setBluetoothModel:", CFSTR("PowerbeatsPro1,1"));
  objc_msgSend((id)powerBeatsPro_powerBeatsPro, "setModel:", 12);
  objc_msgSend((id)powerBeatsPro_powerBeatsPro, "setSupportsSiri:", 1);
  objc_msgSend((id)powerBeatsPro_powerBeatsPro, "setSupportsRepair:", 1);
  objc_msgSend((id)powerBeatsPro_powerBeatsPro, "setSupportsEndCallProx:", 1);
  objc_msgSend((id)powerBeatsPro_powerBeatsPro, "setSupportsMuteCallProx:", 1);
  objc_msgSend((id)powerBeatsPro_powerBeatsPro, "setShowsStatus:", 1);
  objc_msgSend((id)powerBeatsPro_powerBeatsPro, "setHasAddressInAdvertisement:", 1);
  objc_msgSend((id)powerBeatsPro_powerBeatsPro, "setHasSplitBattery:", 1);
  objc_msgSend((id)powerBeatsPro_powerBeatsPro, "setHasLid:", 1);
  objc_msgSend((id)powerBeatsPro_powerBeatsPro, "setButtonLocation:", 0);
  objc_msgSend((id)powerBeatsPro_powerBeatsPro, "setUsesProductCaseName:", 1);
  return objc_msgSend((id)powerBeatsPro_powerBeatsPro, "setHasSplitCaseColors:", 1);
}

+ (SFHeadphoneProduct)b507
{
  if (b507_onceToken != -1)
    dispatch_once(&b507_onceToken, &__block_literal_global_56);
  return (SFHeadphoneProduct *)(id)b507_b507;
}

uint64_t __26__SFHeadphoneProduct_b507__block_invoke()
{
  SFHeadphoneProduct *v0;
  void *v1;

  v0 = -[SFHeadphoneProduct initWithProductID:supportsMobileAsset:]([SFHeadphoneProduct alloc], "initWithProductID:supportsMobileAsset:", 8209, 1);
  v1 = (void *)b507_b507;
  b507_b507 = (uint64_t)v0;

  objc_msgSend((id)b507_b507, "setBluetoothModel:", CFSTR("Device1,8209"));
  objc_msgSend((id)b507_b507, "setModel:", 13);
  objc_msgSend((id)b507_b507, "setSupportsSiri:", 0);
  objc_msgSend((id)b507_b507, "setSupportsRepair:", 1);
  objc_msgSend((id)b507_b507, "setSupportsEndCallProx:", 1);
  objc_msgSend((id)b507_b507, "setShowsStatus:", 1);
  objc_msgSend((id)b507_b507, "setHasAddressInAdvertisement:", 1);
  objc_msgSend((id)b507_b507, "setHasSplitBattery:", 1);
  objc_msgSend((id)b507_b507, "setHasLid:", 1);
  objc_msgSend((id)b507_b507, "setButtonLocation:", 0);
  objc_msgSend((id)b507_b507, "setUsesProductCaseName:", 1);
  return objc_msgSend((id)b507_b507, "setHasSplitCaseColors:", 1);
}

+ (SFHeadphoneProduct)b607
{
  if (b607_onceToken != -1)
    dispatch_once(&b607_onceToken, &__block_literal_global_59);
  return (SFHeadphoneProduct *)(id)b607_b607;
}

uint64_t __26__SFHeadphoneProduct_b607__block_invoke()
{
  SFHeadphoneProduct *v0;
  void *v1;

  v0 = -[SFHeadphoneProduct initWithProductID:supportsMobileAsset:]([SFHeadphoneProduct alloc], "initWithProductID:supportsMobileAsset:", 8214, 1);
  v1 = (void *)b607_b607;
  b607_b607 = (uint64_t)v0;

  objc_msgSend((id)b607_b607, "setBluetoothModel:", CFSTR("Device1,8214"));
  objc_msgSend((id)b607_b607, "setModel:", 16);
  objc_msgSend((id)b607_b607, "setSupportsSiri:", 1);
  objc_msgSend((id)b607_b607, "setSupportsRepair:", 1);
  objc_msgSend((id)b607_b607, "setSupportsEndCallProx:", 1);
  objc_msgSend((id)b607_b607, "setShowsStatus:", 1);
  objc_msgSend((id)b607_b607, "setHasAddressInAdvertisement:", 1);
  objc_msgSend((id)b607_b607, "setHasSplitBattery:", 1);
  objc_msgSend((id)b607_b607, "setHasLid:", 1);
  objc_msgSend((id)b607_b607, "setButtonLocation:", 0);
  objc_msgSend((id)b607_b607, "setUsesProductCaseName:", 1);
  return objc_msgSend((id)b607_b607, "setHasSplitCaseColors:", 0);
}

+ (SFHeadphoneProduct)b463
{
  if (b463_onceToken != -1)
    dispatch_once(&b463_onceToken, &__block_literal_global_62);
  return (SFHeadphoneProduct *)(id)b463_b463;
}

uint64_t __26__SFHeadphoneProduct_b463__block_invoke()
{
  SFHeadphoneProduct *v0;
  void *v1;

  v0 = -[SFHeadphoneProduct initWithProductID:supportsMobileAsset:]([SFHeadphoneProduct alloc], "initWithProductID:supportsMobileAsset:", 8230, 1);
  v1 = (void *)b463_b463;
  b463_b463 = (uint64_t)v0;

  objc_msgSend((id)b463_b463, "setBluetoothModel:", CFSTR("Device1,8230"));
  objc_msgSend((id)b463_b463, "setModel:", 23);
  objc_msgSend((id)b463_b463, "setSupportsRepair:", 1);
  objc_msgSend((id)b463_b463, "setSupportsMuteCallProx:", 1);
  objc_msgSend((id)b463_b463, "setShowsStatus:", 1);
  objc_msgSend((id)b463_b463, "setHasAddressInAdvertisement:", 1);
  objc_msgSend((id)b463_b463, "setHasSplitBattery:", 1);
  objc_msgSend((id)b463_b463, "setHasCaseWithoutBattery:", 1);
  objc_msgSend((id)b463_b463, "setHasLid:", 1);
  objc_msgSend((id)b463_b463, "setButtonLocation:", 2);
  objc_msgSend((id)b463_b463, "setUsesProductCaseName:", 1);
  return objc_msgSend((id)b463_b463, "setHasSplitCaseColors:", 0);
}

+ (SFHeadphoneProduct)b494
{
  if (b494_onceToken != -1)
    dispatch_once(&b494_onceToken, &__block_literal_global_65);
  return (SFHeadphoneProduct *)(id)b494_b494;
}

uint64_t __26__SFHeadphoneProduct_b494__block_invoke()
{
  SFHeadphoneProduct *v0;
  void *v1;

  v0 = -[SFHeadphoneProduct initWithProductID:supportsMobileAsset:]([SFHeadphoneProduct alloc], "initWithProductID:supportsMobileAsset:", 8210, 1);
  v1 = (void *)b494_b494;
  b494_b494 = (uint64_t)v0;

  objc_msgSend((id)b494_b494, "setBluetoothModel:", CFSTR("Device1,8210"));
  objc_msgSend((id)b494_b494, "setModel:", 15);
  objc_msgSend((id)b494_b494, "setSupportsSiri:", 1);
  objc_msgSend((id)b494_b494, "setSupportsRepair:", 1);
  objc_msgSend((id)b494_b494, "setSupportsEndCallProx:", 1);
  objc_msgSend((id)b494_b494, "setSupportsMuteCallProx:", 1);
  objc_msgSend((id)b494_b494, "setShowsStatus:", 1);
  objc_msgSend((id)b494_b494, "setHasAddressInAdvertisement:", 1);
  objc_msgSend((id)b494_b494, "setHasSplitBattery:", 1);
  objc_msgSend((id)b494_b494, "setHasLid:", 1);
  objc_msgSend((id)b494_b494, "setButtonLocation:", 0);
  objc_msgSend((id)b494_b494, "setUsesProductCaseName:", 1);
  return objc_msgSend((id)b494_b494, "setHasSplitCaseColors:", 1);
}

+ (SFHeadphoneProduct)b498
{
  if (b498_onceToken != -1)
    dispatch_once(&b498_onceToken, &__block_literal_global_68);
  return (SFHeadphoneProduct *)(id)b498_b498;
}

uint64_t __26__SFHeadphoneProduct_b498__block_invoke()
{
  SFHeadphoneProduct *v0;
  void *v1;

  v0 = -[SFHeadphoneProduct initWithProductID:supportsMobileAsset:]([SFHeadphoneProduct alloc], "initWithProductID:supportsMobileAsset:", 8221, 1);
  v1 = (void *)b498_b498;
  b498_b498 = (uint64_t)v0;

  objc_msgSend((id)b498_b498, "setBluetoothModel:", CFSTR("Device1,8221"));
  objc_msgSend((id)b498_b498, "setModel:", 22);
  objc_msgSend((id)b498_b498, "setSupportsSiri:", 1);
  objc_msgSend((id)b498_b498, "setSupportsRepair:", 1);
  objc_msgSend((id)b498_b498, "setSupportsMuteCallProx:", 1);
  objc_msgSend((id)b498_b498, "setSupportsCounterfeitDetection:", 1);
  objc_msgSend((id)b498_b498, "setIgnoresBatteryStatusIfCounterfeit:", 1);
  objc_msgSend((id)b498_b498, "setShowsStatus:", 1);
  objc_msgSend((id)b498_b498, "setHasAddressInAdvertisement:", 1);
  objc_msgSend((id)b498_b498, "setHasSplitBattery:", 1);
  objc_msgSend((id)b498_b498, "setHasLid:", 1);
  objc_msgSend((id)b498_b498, "setButtonLocation:", 0);
  objc_msgSend((id)b498_b498, "setUsesProductCaseName:", 1);
  return objc_msgSend((id)b498_b498, "setHasSplitCaseColors:", 1);
}

- (unsigned)productID
{
  return self->_productID;
}

- (void)setProductID:(unsigned int)a3
{
  self->_productID = a3;
}

- (unsigned)altProductID
{
  return self->_altProductID;
}

- (void)setAltProductID:(unsigned int)a3
{
  self->_altProductID = a3;
}

- (unint64_t)model
{
  return self->_model;
}

- (void)setModel:(unint64_t)a3
{
  self->_model = a3;
}

- (NSString)bluetoothModel
{
  return self->_bluetoothModel;
}

- (void)setBluetoothModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)supportsDigitalEngraving
{
  return self->_supportsDigitalEngraving;
}

- (void)setSupportsDigitalEngraving:(BOOL)a3
{
  self->_supportsDigitalEngraving = a3;
}

- (BOOL)supportsMobileAsset
{
  return self->_supportsMobileAsset;
}

- (void)setSupportsMobileAsset:(BOOL)a3
{
  self->_supportsMobileAsset = a3;
}

- (BOOL)supportsRepair
{
  return self->_supportsRepair;
}

- (void)setSupportsRepair:(BOOL)a3
{
  self->_supportsRepair = a3;
}

- (BOOL)supportsSiri
{
  return self->_supportsSiri;
}

- (void)setSupportsSiri:(BOOL)a3
{
  self->_supportsSiri = a3;
}

- (BOOL)supportsSpatialAudio
{
  return self->_supportsSpatialAudio;
}

- (void)setSupportsSpatialAudio:(BOOL)a3
{
  self->_supportsSpatialAudio = a3;
}

- (BOOL)supportsOptimizedBatteryCharging
{
  return self->_supportsOptimizedBatteryCharging;
}

- (void)setSupportsOptimizedBatteryCharging:(BOOL)a3
{
  self->_supportsOptimizedBatteryCharging = a3;
}

- (BOOL)supportsWirelessSplitterInEar
{
  return self->_supportsWirelessSplitterInEar;
}

- (void)setSupportsWirelessSplitterInEar:(BOOL)a3
{
  self->_supportsWirelessSplitterInEar = a3;
}

- (BOOL)supportsFindMyNetwork
{
  return self->_supportsFindMyNetwork;
}

- (void)setSupportsFindMyNetwork:(BOOL)a3
{
  self->_supportsFindMyNetwork = a3;
}

- (BOOL)supportsEndCallProx
{
  return self->_supportsEndCallProx;
}

- (void)setSupportsEndCallProx:(BOOL)a3
{
  self->_supportsEndCallProx = a3;
}

- (BOOL)supportsMuteCallProx
{
  return self->_supportsMuteCallProx;
}

- (void)setSupportsMuteCallProx:(BOOL)a3
{
  self->_supportsMuteCallProx = a3;
}

- (BOOL)supportsAdaptiveControlsProx
{
  return self->_supportsAdaptiveControlsProx;
}

- (void)setSupportsAdaptiveControlsProx:(BOOL)a3
{
  self->_supportsAdaptiveControlsProx = a3;
}

- (BOOL)supportsCounterfeitDetection
{
  return self->_supportsCounterfeitDetection;
}

- (void)setSupportsCounterfeitDetection:(BOOL)a3
{
  self->_supportsCounterfeitDetection = a3;
}

- (BOOL)ignoresBatteryStatusIfCounterfeit
{
  return self->_ignoresBatteryStatusIfCounterfeit;
}

- (void)setIgnoresBatteryStatusIfCounterfeit:(BOOL)a3
{
  self->_ignoresBatteryStatusIfCounterfeit = a3;
}

- (BOOL)showsStatus
{
  return self->_showsStatus;
}

- (void)setShowsStatus:(BOOL)a3
{
  self->_showsStatus = a3;
}

- (BOOL)showsStatusOutOfCase
{
  return self->_showsStatusOutOfCase;
}

- (void)setShowsStatusOutOfCase:(BOOL)a3
{
  self->_showsStatusOutOfCase = a3;
}

- (BOOL)hasAddressInAdvertisement
{
  return self->_hasAddressInAdvertisement;
}

- (void)setHasAddressInAdvertisement:(BOOL)a3
{
  self->_hasAddressInAdvertisement = a3;
}

- (BOOL)hasW1Chip
{
  return self->_hasW1Chip;
}

- (void)setHasW1Chip:(BOOL)a3
{
  self->_hasW1Chip = a3;
}

- (BOOL)hasLid
{
  return self->_hasLid;
}

- (void)setHasLid:(BOOL)a3
{
  self->_hasLid = a3;
}

- (BOOL)hasSplitBattery
{
  return self->_hasSplitBattery;
}

- (void)setHasSplitBattery:(BOOL)a3
{
  self->_hasSplitBattery = a3;
}

- (BOOL)hasCaseWithoutBattery
{
  return self->_hasCaseWithoutBattery;
}

- (void)setHasCaseWithoutBattery:(BOOL)a3
{
  self->_hasCaseWithoutBattery = a3;
}

- (unint64_t)buttonLocation
{
  return self->_buttonLocation;
}

- (void)setButtonLocation:(unint64_t)a3
{
  self->_buttonLocation = a3;
}

- (BOOL)usesProductCaseName
{
  return self->_usesProductCaseName;
}

- (void)setUsesProductCaseName:(BOOL)a3
{
  self->_usesProductCaseName = a3;
}

- (BOOL)hasSplitCaseColors
{
  return self->_hasSplitCaseColors;
}

- (void)setHasSplitCaseColors:(BOOL)a3
{
  self->_hasSplitCaseColors = a3;
}

- (BOOL)isAirPods
{
  return self->_isAirPods;
}

- (void)setIsAirPods:(BOOL)a3
{
  self->_isAirPods = a3;
}

- (BOOL)hasCaseBT
{
  return self->_hasCaseBT;
}

- (void)setHasCaseBT:(BOOL)a3
{
  self->_hasCaseBT = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bluetoothModel, 0);
}

@end
