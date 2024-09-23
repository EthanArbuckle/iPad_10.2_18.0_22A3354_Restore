@implementation PKSubcredentialProvisioningOwnerPairingTransitionTable

- (BOOL)isValidStateTransitionFrom:(int64_t)a3 to:(int64_t)a4
{
  BOOL result;
  BOOL v5;

  result = 0;
  switch(a4)
  {
    case 0:
    case 1:
      return 1;
    case 5:
      v5 = a3 == 8;
      goto LABEL_11;
    case 6:
      v5 = a3 == 5;
      goto LABEL_11;
    case 7:
      v5 = a3 == 6;
      goto LABEL_11;
    case 8:
      v5 = a3 == 2;
      goto LABEL_11;
    case 9:
      v5 = (a3 & 0xFFFFFFFFFFFFFFFELL) == 6;
      goto LABEL_11;
    case 10:
    case 11:
      v5 = a3 == 9;
      goto LABEL_11;
    case 12:
      v5 = (a3 & 0xFFFFFFFFFFFFFFFELL) == 10;
      goto LABEL_11;
    case 16:
      v5 = a3 == 12;
LABEL_11:
      result = v5;
      break;
    default:
      return result;
  }
  return result;
}

- (BOOL)isValidStartingState:(int64_t)a3
{
  return a3 == 2;
}

@end
