@implementation CBUUID

+ (id)_cl_DurianServiceUUID
{
  return +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("7DFC7000-7D1C-4951-86AA-8D9728F8D66C"));
}

+ (id)_cl_DurianDebugServiceUUID
{
  return +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("7DFC8000-7D1C-4951-86AA-8D9728F8D66C"));
}

+ (id)_cl_DurianUnauthorizedConnectionServiceUUID
{
  return +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("7DFC9000-7D1C-4951-86AA-8D9728F8D66C"));
}

+ (id)_cl_DurianLoggingCharacteristicUUID
{
  return +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("7DFC8003-7D1C-4951-86AA-8D9728F8D66C"));
}

+ (id)_cl_DurianUnauthorizedSoundCharacteristicUUID
{
  return +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("7DFC9001-7D1C-4951-86AA-8D9728F8D66C"));
}

+ (id)_cl_DurianKeyIndexCharacteristicUUID
{
  return +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("7DFC9002-7D1C-4951-86AA-8D9728F8D66C"));
}

+ (id)_cl_DurianUnauthorizedPrecisionFindingCharacteristicUUID
{
  return +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("7DFC9003-7D1C-4951-86AA-8D9728F8D66C"));
}

+ (id)_cl_BtTxPowerServiceUUID
{
  return +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("1804"));
}

+ (id)_cl_BtTxPowerCharacteristicUUID
{
  return +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("2A07"));
}

+ (id)_cl_HawkeyeFindMyNetworkServiceUUID
{
  return +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("FD44"));
}

+ (id)_cl_HawkeyeConfigurationCharacteristicUUID
{
  return +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("4F860002-943B-49EF-BED4-2F730304427A"));
}

+ (id)_cl_HawkeyeNonOwnerCharacteristicUUID
{
  return +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("4F860003-943B-49EF-BED4-2F730304427A"));
}

+ (id)_cl_HawkeyePairedOwnerInformationCharacteristicUUID
{
  return +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("4F860004-943B-49EF-BED4-2F730304427A"));
}

+ (id)_cl_HawkeyeDebugCharacteristicUUID
{
  return +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("4F860005-943B-49EF-BED4-2F730304427A"));
}

+ (id)_cl_HawkeyePreciseFindingCharacteristicUUID
{
  return +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("4F860006-943B-49EF-BED4-2F730304427A"));
}

+ (id)_cl_HawkeyeAccessoryInformationServiceUUID
{
  return +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("87290102-3C51-43B1-A1A9-11B9DC38478B"));
}

+ (id)_cl_HawkeyeAccessoryInformationServiceProductDataCharacteristicUUID
{
  return +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("6AA50001-6352-4D57-A7B4-003A416FBB0B"));
}

+ (id)_cl_HawkeyeAccessoryInformationServiceManufacturerNameCharacteristicUUID
{
  return +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("6AA50002-6352-4D57-A7B4-003A416FBB0B"));
}

+ (id)_cl_HawkeyeAccessoryInformationServiceModelNameCharacteristicUUID
{
  return +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("6AA50003-6352-4D57-A7B4-003A416FBB0B"));
}

+ (id)_cl_HawkeyeAccessoryInformationServiceModelColorCodeCharacteristicUUID
{
  return +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("6AA50004-6352-4D57-A7B4-003A416FBB0B"));
}

+ (id)_cl_HawkeyeAccessoryInformationServiceAccessoryCategoryCharacteristicUUID
{
  return +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("6AA50005-6352-4D57-A7B4-003A416FBB0B"));
}

+ (id)_cl_HawkeyeAccessoryInformationServiceAccessoryCapabilitiesCharacteristicUUID
{
  return +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("6AA50006-6352-4D57-A7B4-003A416FBB0B"));
}

+ (id)_cl_HawkeyeAccessoryInformationServiceFirmwareVersionCharacteristicUUID
{
  return +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("6AA50007-6352-4D57-A7B4-003A416FBB0B"));
}

+ (id)_cl_HawkeyeAccessoryInformationServiceFindMyVersionCharacteristicUUID
{
  return +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("6AA50008-6352-4D57-A7B4-003A416FBB0B"));
}

+ (id)_cl_HawkeyeAccessoryInformationServiceBatteryTypeCharacteristicUUID
{
  return +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("6AA50009-6352-4D57-A7B4-003A416FBB0B"));
}

+ (id)_cl_HawkeyeAccessoryInformationServiceBatteryLevelCharacteristicUUID
{
  return +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("6AA5000A-6352-4D57-A7B4-003A416FBB0B"));
}

+ (id)_cl_HawkeyeAccessoryFirmwareUpdateServiceUUID
{
  return +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("FD43"));
}

+ (id)_cl_HawkeyeAccessoryFirmwareUpdateMsgCharacteristicUUID
{
  return +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("94110001-6D9B-4225-A4F1-6A4A7F01B0DE"));
}

+ (id)_cl_PoshAccessoryNonOwnerServiceUUID
{
  return +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("15190001-12F4-C226-88ED-2AC5579F2A85"));
}

+ (id)_cl_PoshAccessoryNonOwnerCharacteristicUUID
{
  return +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("8E0C0001-1D68-FB92-BF61-48377421680E"));
}

@end
