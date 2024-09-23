@implementation VGVehicleDeduper

+ (int64_t)actionForAddingNewVehicle:(id *)a3 withExistingGarageVehicles:(id)a4 andUnpairedVehicles:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  int64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (!a3)
  {
    VGGetAssertLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    v19 = 136446722;
    v20 = "+[VGVehicleDeduper actionForAddingNewVehicle:withExistingGarageVehicles:andUnpairedVehicles:]";
    v21 = 2082;
    v22 = "newVehicle == nil";
    v23 = 2082;
    v24 = "newVehicle cannot be nil";
LABEL_12:
    _os_log_impl(&dword_20A329000, v15, OS_LOG_TYPE_ERROR, "%{public}s forbids: %{public}s. %{public}s", (uint8_t *)&v19, 0x20u);
    goto LABEL_13;
  }
  if (!v8)
  {
    VGGetAssertLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    v19 = 136446722;
    v20 = "+[VGVehicleDeduper actionForAddingNewVehicle:withExistingGarageVehicles:andUnpairedVehicles:]";
    v21 = 2082;
    v22 = "garageVehicles == nil";
    v23 = 2082;
    v24 = "garageVehicles cannot be nil";
    goto LABEL_12;
  }
  if (!v9)
  {
    VGGetAssertLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v19 = 136446722;
      v20 = "+[VGVehicleDeduper actionForAddingNewVehicle:withExistingGarageVehicles:andUnpairedVehicles:]";
      v21 = 2082;
      v22 = "unpairedVehicles == nil";
      v23 = 2082;
      v24 = "unpairedVehicles cannot be nil";
      goto LABEL_12;
    }
LABEL_13:

    v14 = 0;
    goto LABEL_19;
  }
  objc_msgSend(a1, "_vehicleMatchingVehicle:inArray:", *a3, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  v13 = *a3;
  if (v11)
  {
    objc_msgSend(v11, "_vehicleByUpdatingWithVehicle:", v13);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    v14 = 1;
  }
  else
  {
    objc_msgSend(a1, "_vehicleMatchingVehicle:inArray:", v13, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      objc_msgSend(v16, "_vehicleByUpdatingWithVehicle:", *a3);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      v14 = 3;
    }
    else
    {
      v14 = 2;
    }

  }
LABEL_19:

  return v14;
}

+ (id)_vehicleMatchingVehicle:(id)a3 inArray:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v5 = a3;
  v6 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __52__VGVehicleDeduper__vehicleMatchingVehicle_inArray___block_invoke;
  v11[3] = &unk_24C2FB168;
  v7 = v5;
  v12 = v7;
  v8 = objc_msgSend(v6, "indexOfObjectPassingTest:", v11);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v6, "objectAtIndex:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

uint64_t __52__VGVehicleDeduper__vehicleMatchingVehicle_inArray___block_invoke(uint64_t a1, void *a2)
{
  return VGVehiclesHaveMatchingVehicleStateProviders(*(void **)(a1 + 32), a2);
}

@end
