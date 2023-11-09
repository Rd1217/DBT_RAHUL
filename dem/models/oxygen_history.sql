select
    GatewayLeft as User,
    GatewayRight as Guest,
    COUNT(CASE WHEN (
        (EventLabel ='Pstn/OutDial' OR EventLabel ='DialerEvents') and 
        lower(OAction) = 'dial' and 
        (lower(OResult)='dialing' OR lower(OResult)='dialling')
    ) THEN 1 ELSE NULL END) as TotalCall
    From oxygen_history.oxygen_history_buffer
WHERE EventTemplate='_FFFFFFFFFFFFFF00001575592773802029_'
