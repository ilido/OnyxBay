import { useBackend } from '../backend';
import { Button, LabeledList, Section } from '../components';
import { Window } from '../layouts';

export const Helm = (act, data) => {
  
  const {
    X_coord,
    Y_coord,
  } = data;

  return (

    <Window>
      <Window.Content>
      <Button
        content="Open map"
        onClick={() => act("map")} />
            <LabeledList>
              <LabeledList.Item label="X">
                {X_coord}
              </LabeledList.Item>
              <LabeledList.Item label="Y">
                {Y_coord}
              </LabeledList.Item>
            </LabeledList>
      </Window.Content>
    </Window>
    );
};
