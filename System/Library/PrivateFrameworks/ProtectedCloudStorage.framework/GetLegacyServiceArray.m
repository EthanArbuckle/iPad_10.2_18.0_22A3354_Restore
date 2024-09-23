@implementation GetLegacyServiceArray

uint64_t __GetLegacyServiceArray_block_invoke()
{
  uint64_t result;
  _QWORD v1[12];

  v1[11] = *MEMORY[0x1E0C80C00];
  v1[0] = kPCSServiceMaster;
  v1[1] = kPCSServiceBladerunner;
  v1[2] = kPCSServiceHyperion;
  v1[3] = kPCSServiceLiverpool;
  v1[4] = kPCSServiceEscrow;
  v1[5] = kPCSServiceFDE;
  v1[6] = kPCSServicePianoMover;
  v1[7] = kPCSServiceBackup;
  v1[8] = kPCSServiceSharing;
  v1[9] = kPCSServiceGaming;
  v1[10] = kPCSServiceBTPairing;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 11);
  result = objc_claimAutoreleasedReturnValue();
  GetLegacyServiceArray_array = result;
  return result;
}

@end
