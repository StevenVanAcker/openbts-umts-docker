Installation script for OpenBTS-UMTS.
I am using an Ettus USRP B210.
The device is visible with uhd_find_devices.
Output from uhd_usrp_probe indicates that the device is operating over USB3 and all tests pass.

I always get the following error when starting /OpenBTS/OpenBTS-UMTS:

	1586988849.037967 140405913459584: Starting the transceiver...

	ALERT 140405913459584 22:14:20.0 TRXManager.cpp:66:sendCommandPacket: RSP response 
	ALERT 140405913459584 22:14:20.0 TRXManager.cpp:81:powerOff: POWEROFF failed with status -1
	ALERT 140405913459584 22:14:26.0 TRXManager.cpp:66:sendCommandPacket: RSP response 
	ALERT 140405913459584 22:14:26.0 TRXManager.cpp:412:tune: TXTUNE failed with status -1
	ALERT 140405793191680 22:14:29.0 TRXManager.cpp:258:clockHandler: TRX clock interface timed out, assuming TRX is dead.
	ALERT 140405913459584 22:14:32.0 TRXManager.cpp:66:sendCommandPacket: RSP response 
	ALERT 140405913459584 22:14:32.0 TRXManager.cpp:112:setRxGain: SETRXGAIN failed with status -1
	ALERT 140405793191680 22:14:32.0 TRXManager.cpp:258:clockHandler: TRX clock interface timed out, assuming TRX is dead.
	ALERT 140405793191680 22:14:35.0 TRXManager.cpp:258:clockHandler: TRX clock interface timed out, assuming TRX is dead.
	ALERT 140405913459584 22:14:38.0 TRXManager.cpp:66:sendCommandPacket: RSP response 
	ALERT 140405913459584 22:14:38.0 TRXManager.cpp:499:powerOn: POWERON failed with status -1
	ALERT 140405793191680 22:14:38.0 TRXManager.cpp:258:clockHandler: TRX clock interface timed out, assuming TRX is dead.
	ALERT 140405793191680 22:14:41.0 TRXManager.cpp:258:clockHandler: TRX clock interface timed out, assuming TRX is dead.

I've tried this setup with the following configuration:
 * As a docker container on docker host Ubuntu 18.04.4
 * On Ubuntu 18.04.4 host without rebooting
 * On Ubuntu 18.04.4 host with rebooting
 * On Ubuntu 18.04.4 host with linux-image-lowlatency
