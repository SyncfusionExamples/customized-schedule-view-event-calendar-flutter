import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() => runApp(ScheduleViewCustomization());

class ScheduleViewCustomization extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CustomizationState();
}

class CustomizationState extends State<ScheduleViewCustomization> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: SfCalendar(
            view: CalendarView.schedule,
            dataSource: getCalendarDataSource(),
            scheduleViewSettings: ScheduleViewSettings(
                appointmentTextStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.lime),
                appointmentItemHeight: 70.0,
                dayHeaderSettings: DayHeaderSettings(
                    dayFormat: 'EEEE',
                    width: 70,
                    dateTextStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: Colors.red,
                    ),
                    dayTextStyle: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                      color: Colors.red,
                    )),
                hideEmptyScheduleWeek: true,
                monthHeaderSettings: MonthHeaderSettings(
                    monthFormat: 'MMMM, yyyy',
                    height: 100,
                    textAlign: TextAlign.left,
                    backgroundColor: Colors.green,
                    monthTextStyle: TextStyle(
                        color: Colors.red,
                        fontSize: 25,
                        fontWeight: FontWeight.w400)),
                weekHeaderSettings: WeekHeaderSettings(
                  startDateFormat: 'dd MMM ',
                  endDateFormat: 'dd MMM, yy',
                  height: 50,
                  textAlign: TextAlign.center,
                  backgroundColor: Colors.red,
                  weekTextStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                )),
          ),
        ),
      ),
    );
  }

  _DataSource getCalendarDataSource() {
    final List<Appointment> appointments = <Appointment>[];
    appointments.add(Appointment(
      startTime: DateTime.now(),
      endTime: DateTime.now().add(const Duration(hours: 1)),
      subject: 'Meeting',
      color: Colors.pink,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(hours: 4)),
      endTime: DateTime.now().add(const Duration(hours: 5)),
      subject: 'Release Meeting',
      color: Colors.lightBlueAccent,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(hours: 6)),
      endTime: DateTime.now().add(const Duration(hours: 7)),
      subject: 'Performance check',
      color: Colors.amber,
    ));
    appointments.add(Appointment(
      startTime: DateTime(2020, 1, 22, 1, 0, 0),
      endTime: DateTime(2020, 1, 22, 3, 0, 0),
      subject: 'Support',
      color: Colors.green,
    ));
    appointments.add(Appointment(
      startTime: DateTime(2020, 1, 24, 3, 0, 0),
      endTime: DateTime(2020, 1, 24, 4, 0, 0),
      subject: 'Retrospective',
      color: Colors.purple,
    ));

    return _DataSource(appointments);
  }
}

class _DataSource extends CalendarDataSource {
  _DataSource(List<Appointment> source) {
    appointments = source;
  }
}
