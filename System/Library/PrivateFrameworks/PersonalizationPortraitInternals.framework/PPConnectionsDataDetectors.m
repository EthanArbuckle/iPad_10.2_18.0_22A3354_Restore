@implementation PPConnectionsDataDetectors

+ (id)addressComponentValueWithLocationField:(unsigned __int8)a3 forDataDetectorsMatch:(id)a4 addressComponents:(id)a5
{
  int v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD *v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  v8 = a5;
  v9 = v8;
  v10 = 0;
  switch(v6)
  {
    case 1:
      v11 = v7;
      goto LABEL_11;
    case 2:
      v12 = (_QWORD *)MEMORY[0x1E0CB3288];
      goto LABEL_10;
    case 3:
      v12 = (_QWORD *)MEMORY[0x1E0CB3298];
      goto LABEL_10;
    case 4:
      v12 = (_QWORD *)MEMORY[0x1E0CB3260];
      goto LABEL_10;
    case 5:
      v12 = (_QWORD *)MEMORY[0x1E0CB32A0];
      goto LABEL_10;
    case 6:
      v12 = (_QWORD *)MEMORY[0x1E0CB3290];
      goto LABEL_10;
    case 7:
      objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3260]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3290]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPConnectionsAddressFormatter formattedCityAndStateWithCity:state:](PPConnectionsAddressFormatter, "formattedCityAndStateWithCity:state:", v13, v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    case 9:
      v12 = (_QWORD *)MEMORY[0x1E0CB3268];
LABEL_10:
      objc_msgSend(v8, "objectForKeyedSubscript:", *v12);
      v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:
      v10 = v11;
      break;
    default:
      break;
  }

  return v10;
}

@end
